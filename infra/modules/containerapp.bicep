@description('The name of the container app')
param name string

@description('The location for all resources')
param location string

@description('The ID of the container app environment')
param environmentId string

@description('The container image to deploy')
param containerImage string = 'mcr.microsoft.com/azuredocs/containerapps-helloworld:latest'

@description('The container port')
param containerPort int

@description('The container registry server')
param registryServer string

@description('The managed identity resource ID for registry access')
param managedIdentityResourceId string

@description('The managed identity client ID for registry access')
param managedIdentityClientId string

@description('Environment variables for the container')
param envVars array = []

resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: name
  location: location
  tags: {
    'azd-service-name': 'api'
  }
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${managedIdentityResourceId}': {}
    }
  }
  properties: {
    environmentId: environmentId
    configuration: {
      ingress: {
        external: true
        targetPort: containerPort
        allowInsecure: false
        corsPolicy: {
          allowedOrigins: ['*']
          allowedMethods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS']
          allowedHeaders: ['*']
          allowCredentials: false
        }
      }
      registries: [
        {
          server: registryServer
          identity: managedIdentityClientId
        }
      ]
    }
    template: {
      containers: [
        {
          name: 'fastapi-app'
          image: !empty(containerImage) ? containerImage : 'mcr.microsoft.com/azuredocs/containerapps-helloworld:latest'
          env: envVars
          resources: {
            cpu: json('0.25')
            memory: '0.5Gi'
          }
        }
      ]
      scale: {
        minReplicas: 1
        maxReplicas: 3
      }
    }
  }
}

output name string = containerApp.name
output endpoint string = 'https://${containerApp.properties.configuration.ingress.fqdn}'
