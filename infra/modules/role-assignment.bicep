@description('The resource ID of the container registry')
param registryId string

@description('The principal ID of the managed identity')
param managedIdentityPrincipalId string

// Get reference to the existing registry
resource containerRegistry 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' existing = {
  name: last(split(registryId, '/'))
}

// Assign AcrPull role to the managed identity
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(registryId, managedIdentityPrincipalId, 'AcrPull')
  scope: containerRegistry
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '7f951dda-4ed3-4680-a7ca-43fe172d538d') // AcrPull role
    principalId: managedIdentityPrincipalId
    principalType: 'ServicePrincipal'
  }
}
