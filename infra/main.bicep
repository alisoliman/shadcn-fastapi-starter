targetScope = 'resourceGroup'

@description('The environment name')
param environmentName string

@description('The location for all resources')
param location string = resourceGroup().location

@description('The container image to deploy')
param containerImage string = 'mcr.microsoft.com/azuredocs/containerapps-helloworld:latest'

// Generate a unique resource token
var resourceToken = uniqueString(subscription().id, resourceGroup().id, environmentName)
var tags = { 'azd-env-name': environmentName }

// Container apps stack (including container registry and environment)
module containerAppsStack 'modules/container-apps-stack.bicep' = {
  name: 'container-apps-stack'
  params: {
    containerAppsEnvironmentName: 'env-${resourceToken}'
    containerRegistryName: 'acr${resourceToken}'
    location: location
    tags: tags
  }
}

// Create user-assigned managed identity
resource identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'id-${resourceToken}'
  location: location
  tags: tags
}

// Assign AcrPull role to the managed identity
module roleAssignment 'modules/role-assignment.bicep' = {
  name: 'registry-role-assignment'
  params: {
    registryId: containerAppsStack.outputs.registryId
    managedIdentityPrincipalId: identity.properties.principalId
  }
  dependsOn: [
    containerAppsStack
    identity
  ]
}

// API Container App
module api 'modules/containerapp.bicep' = {
  name: 'api'
  params: {
    name: 'api-${resourceToken}'
    location: location
    environmentId: containerAppsStack.outputs.environmentId
    containerImage: containerImage
    containerPort: 80
    registryServer: containerAppsStack.outputs.registryLoginServer
    managedIdentityResourceId: identity.id
    managedIdentityClientId: identity.properties.clientId
    envVars: []
  }
  dependsOn: [
    roleAssignment
  ]
}

// Output the container app endpoint
output containerAppEndpoint string = api.outputs.endpoint

output AZURE_CONTAINER_REGISTRY_NAME string = containerAppsStack.outputs.registryName
output AZURE_CONTAINER_REGISTRY_LOGIN_SERVER string = containerAppsStack.outputs.registryLoginServer
output AZURE_CONTAINER_REGISTRY_ENDPOINT string = 'https://${containerAppsStack.outputs.registryLoginServer}'
output AZURE_CONTAINER_ENVIRONMENT_NAME string = containerAppsStack.outputs.environmentName
output AZURE_CONTAINER_APP_NAME string = api.outputs.name
output AZURE_CONTAINER_APP_ENDPOINT string = api.outputs.endpoint
output AZURE_MANAGED_IDENTITY_ID string = identity.id
output RESOURCE_GROUP_ID string = resourceGroup().id

// Apply tags to the resource group
resource rgTags 'Microsoft.Resources/tags@2024-11-01' = {
  name: 'default'
  properties: {
    tags: {
      'azd-env-name': environmentName
    }
  }
}
