### Defination
| Authentication        | Authorization    |
| ---------------------:|:---------------: |
| who are you?          | Can you do this? |
| Establishing identity | verifying access |
| 401 Unauthorized      | 403 Forbidden    |

# Terms
 - The third party Application: `Client`: The client is the application that is attemping to get access to the user's account.
It need to get permission from user before it can do so.
 - The API: `Resouce Server`: The resouce server is the API server used to access the user's infomation.

### Token based authentication
 - Alternative to session cookies
 - You don't worry about CSRF
 - Authorization: Bearer <-token->
### Access token
 - Often randomly generated strings
 - Has a limited lifetime
### Grant Types
 - Authorization Code
 - Implicit
 - **_Resource Owner Password_** (this type will be used in this article)
 - Client Credentials

### Flow
1. OAuth2:
![](https://assets.digitalocean.com/articles/oauth/abstract_flow.png "withouth doorkeeper")
2. with doorkeeper
![](https://i.imgur.com/zrwbb5j.png "with doorkeeper")

### routes
1. Default routes: `/oauth/token` params: `[:email, :password, :grant_type]`
-> generate access_token
EX:
```
curl -X POST 'localhost:3000/oauth/token?grant_type=password&email=test@gmail.com&password=123456'
```
response:
```
{"status":"Success","status_code":1000,"message":"Successfully authenticated user","key_message":"successfully_authenticated_user","data":{"access_token":"8c0484443cc7c3c86dfa529ed98e2e6636d2893f806bef73e06022056d9cc861","first_login":false},"timestamp":1552966294}

```

