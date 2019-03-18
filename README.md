## NOTE
 1. I assume that you know how oauth work :D
 2. With purpose is help you understand how oauth work in api rails application with devise and doorkeeper, so i just install and configure basically.
 3. If you want to be more please access them pages. 
 #
## Defination
| Authentication        | Authorization    |
| ---------------------:|:---------------: |
| who are you?          | Can you do this? |
| Establishing identity | verifying access |
| 401 Unauthorized      | 403 Forbidden    |

## Token based authentication
 - Alternative to session cookies
 - You don't worry about CSRF
 - Authorization: Bearer <-token->
## Access token
 - Often randomly generated strings
 - Has a limited lifetime
## Grant Types
 - Authorization Code
 - Implicit
 - **_Resource Owner Password_** (this type will be used in this article)
 - Client Credentials
#
## Flow
1. OAuth2:
![](https://assets.digitalocean.com/articles/oauth/abstract_flow.png "withouth doorkeeper")
2. with doorkeeper
![](https://i.imgur.com/zrwbb5j.png "with doorkeeper")
