## Python home project
- At the moment the password for the DB is randomly generated. -in production would use a secret manager
- The web server for djangos REST API UI is for testing therefore there are a few plasters to make it work on AWS, in production we would use production ready web servers like nginx to serve traffic. It currently runs on port 8000 with http.

# Endpoints:
- /people/create - Create
- /people - Read list of people
- /people/ID - Read person
- /people/update/ID - Update person
- /people/delete/ID - Delete person