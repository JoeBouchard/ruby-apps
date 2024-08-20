# Joe's Ruby Apps

This is a collection of applications I am working on in the process of learning the intricacies of Ruby on Rails.
Parts of this are intentionally over-engineered for the purpose of learning how to configure and work with certain gems.

![Rails Version](https://img.shields.io/badge/Ruby-3.3.4-17B169) ![Rails Version](https://img.shields.io/badge/Rails-7.2.0-17B169)
## Basic Structure
This project uses the standard MVC structure with Models, Controllers, and Views.

### Models
The Models are all associated with tables in the database using Active Record.
The database is currently managed with the default SQLite interface.

Currently, there are two models:
- `User`: Users who have logged in. Stores the User's email address.
- `Entry`: Notes created in the Todo Manager. Stores each note's message, due date, and priority.

Future Plans:
1. Associate `Users` and `Entries` to track which User created the Entry.
2. Configure Active Record to use Postgres database when running in Docker Compose.

### Controllers
The controllers handle HTTP requests of various types

Currently, there are two controllers along with the base controller
- `Entries`: Handles GET operations for the `Entry` model.
- `Sessions`: Handles log in and log out endpoints.
- `Application`: Base controller. Forces authentication and gets the active user for other controllers to use

Future Plans:
1. Improve `Entries` controller to handle all CRUD operations for the `Entry` model.
2. Add a `Users` controller to allow a user to manage their account

### Views
The views display the rendered HTML for a given controller's response.

The HTML is styled and made interactive with the Bootstrap CSS toolkit.

Future Plans:
1. Add views to correspond to improved `Entries` operations
2. Restyle sidebar to have relevant options rather than the default
3. Make it look better

## Running the code
This application has two ways it can be run, with slightly different features available in each

1. Standard way: run `bin/rails server -b 127.0.0.1 -p 3000 -e development` in the root of this project
using a Linux command line
2. Docker Compose: If you have [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/) installed,
run `docker compose up --build -d`  

In the standard method, the application runs as a standalone instance.
It uses OmniAuth's pass through authentication, a local Sqlite database as its database,
and no way to view emails the application has sent.

In the containerized Docker Compose method, the application runs with a suite of support services.
The application itself is available at `localhost:3000`.
Keycloak OIDC provider is available at `localhost:8888`, and the application authenticates against it using an OIDC plugin for OmniAuth.
A Postgres database is available at `localhost:5432` and is used by Keycloak (plan to use with the application as well).
A fake SMTP server is available at `localhost:4040`. This receives all emails sent by the application and displays them.

Future plans:
1. Connect the application to the Postgres database using Active Record
2. Make the application send emails
3. Configure SonarQube and SonarScan static code analysis to run on Docker Compose
