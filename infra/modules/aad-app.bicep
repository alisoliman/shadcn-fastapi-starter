@description('Display name for the Entra ID application')
param displayName string

@description('Redirect URIs for the app')
param redirectUris array = []

resource app 'Microsoft.Graph/applications@1.0' = {
  name: displayName
  properties: {
    displayName: displayName
    signInAudience: 'AzureADMyOrg'
    web: {
      redirectUris: redirectUris
    }
  }
}

output clientId string = app.properties.appId
output objectId string = last(split(app.id, '/'))
