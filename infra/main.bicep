targetScope = 'resourceGroup'

@description('The environment name')
param environmentName string

@description('The location for all resources')
param location string = resourceGroup().location

@description('The container image to deploy')
param containerImage string = 'mcr.microsoft.com/azuredocs/containerapps-helloworld:latest'

@description('The project name for resource naming')
param projectName string = 'shadcn-fastapi'

// Location abbreviations for consistent naming
var locationAbbr = {
  eastus: 'eus'
  westus: 'wus'
  eastus2: 'eus2'
  westus2: 'wus2'
  centralus: 'cus'
  northcentralus: 'ncus'
  southcentralus: 'scus'
  westcentralus: 'wcus'
  canadacentral: 'cac'
  canadaeast: 'cae'
  brazilsouth: 'brs'
  northeurope: 'neu'
  westeurope: 'weu'
  uksouth: 'uks'
  ukwest: 'ukw'
  francecentral: 'frc'
  francesouth: 'frs'
  germanywestcentral: 'gwc'
  norwayeast: 'noe'
  switzerlandnorth: 'szn'
  swedencentral: 'sec'
  japaneast: 'jpe'
  japanwest: 'jpw'
  australiaeast: 'aue'
  australiasoutheast: 'aus'
  southeastasia: 'sea'
  eastasia: 'eas'
  southafricanorth: 'san'
  centralindia: 'cin'
  southindia: 'sin'
  westindia: 'win'
}

// Generate unique resource prefix
var locationCode = locationAbbr[location] ?? 'unk'
var resourcePrefix = '${projectName}-${environmentName}-${locationCode}'

// Common tags for all resources
var commonTags = {
  Environment: environmentName
  Project: projectName
  Location: location
  ManagedBy: 'Bicep'
}

// Generate unique names for resources - simplified container registry naming
var containerAppsEnvironmentName = '${resourcePrefix}-env'
var containerRegistryName = 'cr${replace(environmentName, '-', '')}${uniqueString(resourceGroup().id)}'
var managedIdentityName = '${resourcePrefix}-identity'
var containerAppName = '${resourcePrefix}-app'

// Create managed identity for container registry access
resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: managedIdentityName
  location: location
  tags: commonTags
}

// Deploy container apps stack (environment + registry)
module containerAppsStack 'modules/container-apps-stack.bicep' = {
  name: 'container-apps-stack'
  params: {
    containerAppsEnvironmentName: containerAppsEnvironmentName
    containerRegistryName: containerRegistryName
    location: location
    tags: commonTags
    projectName: projectName
    environmentName: environmentName
  }
}

// Assign AcrPull role to managed identity
module roleAssignment 'modules/role-assignment.bicep' = {
  name: 'role-assignment'
  params: {
    registryId: containerAppsStack.outputs.containerRegistryId
    managedIdentityPrincipalId: managedIdentity.properties.principalId
    resourcePrefix: resourcePrefix
  }
  dependsOn: [
    containerAppsStack
    managedIdentity
  ]
}

// Deploy container app
module containerApp 'modules/containerapp.bicep' = {
  name: 'container-app'
  params: {
    name: containerAppName
    location: location
    environmentId: containerAppsStack.outputs.containerAppsEnvironmentId
    containerImage: containerImage
    containerPort: 8000
    registryServer: containerAppsStack.outputs.containerRegistryLoginServer
    managedIdentityResourceId: managedIdentity.id
    managedIdentityClientId: managedIdentity.properties.clientId
    tags: commonTags
    resourcePrefix: resourcePrefix
  }
  dependsOn: [
    containerAppsStack
    roleAssignment
  ]
}

// Outputs
output containerAppFqdn string = containerApp.outputs.fqdn
output containerRegistryLoginServer string = containerAppsStack.outputs.containerRegistryLoginServer
output managedIdentityClientId string = managedIdentity.properties.clientId
output resourceGroupName string = resourceGroup().name

