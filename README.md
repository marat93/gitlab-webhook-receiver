# README

API for Mobile Test App

## Installation
In development mode app is running as a Docker Compose service

### Docker

Run Docker Compose
```
docker-compose -f docker-compose.dev.yml up
```

You can also use Docker Compose to run the app in production mode
```
docker-compose up
```

## API Documentation
To save your time you can utilize [this Postman collection](Test APP.postman_collection.json)
### Sing in
To sign in pass your password as a SHA1 hashed string in the authorization header. Due to the nature of this project credentials are hard coded. Use `mitosinka` as a username and `milan` as a password. Put `c5983e484db0b621516387b3e50af84020b214c0` to `Authorization` header.
```
POST /api/v1/authentication/login

Authorization: {{SHA1 HASHED PASSWORD}}
Content-Type: application/x-www-form-urlencoded
---
username={{USERNAME}
```
As a response you will get a token that you should use for all the future requests
```json
{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJlpcmVzXjoiMjAyMi0xM...",
    "exp": "11-08-2022 13:52"
}
```

When credentials are wrong you'll get a corresponding error message with a 401 HTTP status
```json
{
    "error": "unauthorized"
}
```

To get info about current user send a request to `/info` endpoint
```
GET /api/v1/authentication/info
```
Response:
```
{
    "expires_at": "2022-11-08 15:13:48 +0000",
    "exp": 1668003228
}
```

### Getting image
As a logged-in user make a following request to get base64 encoded image
```
GET /api/v1/image
Authorization: {{TOKEN}}
```
Base64 encoded image is returned as a response
```
data:image/jpg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAkGBwgHBgkIBwgKCgkLDRYPDQwM...
```

## Description
### Business logic separation
The app is designed with [Skinny Controllers, Fat Services](https://medium.com/marmolabs/e04cfe2d6ae) practice in mind. Basically, all the code that is not related to serving requests is moved out of controllers.

### Versioning
You might have noticed that API is versioned. In case of this test app it may be overkill but it's generally a good practice for APIs to be versioned.

### Guidelines
Code in this app follows [RuboCop style guides](https://github.com/rubocop/ruby-style-guide)

### Commit Messages Convention
Commit messages are following [this convention](https://cbea.ms/git-commit/)

### TO DO
- Move credentials to environment variables
- Implement [JSON API](https://jsonapi.org/) specification