## Providing Access to Terraform in Azure.

1. First Register an application on **Azure Active Directory**, In Supported account types **Accounts in this organization directory only** should be checked. other fields can be left as it is.
2. once the application is registered, generate client Credentials for the app. **client credentials will only be shown once to copy the secret value**.
3. After this, click on **Subscriptions** and go to **Access Control(IAM)** to provide a role for our application. We should provide a **contributor role** to our application.
