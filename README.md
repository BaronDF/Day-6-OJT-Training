
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Day 6 OJT Training Task Manager – Ruby on Rails OJT Project

## Project Overview

This project is a simple Task Manager web application developed using Ruby on Rails during my On-the-Job Training (OJT).

The application allows users to create, view, edit, and delete tasks. It uses PostgreSQL as its database management system.

## Technologies Used

- **Ruby** – Programming language
- **Ruby on Rails 8.1.4.1** – Web application framework
- **PostgreSQL 18** – Database management system
- **Bundler** – Ruby gem dependency manager
- **Visual Studio Code** – Code editor
- **PowerShell** – Command-line interface

## Activities Completed

### 1. Environment Setup
- Installed and configured Ruby.
- Installed Ruby on Rails.
- Installed PostgreSQL.
- Set up the development environment using Visual Studio Code.

### 2. Database Configuration
- Configured Rails to use PostgreSQL instead of SQLite.
- Updated the `config/database.yml` file.
- Configured the PostgreSQL username, password, and host.
- Created the development and test databases.

### 3. Rails Scaffold Generation

Generated the Task scaffold using:

```bash
rails generate scaffold Task title:string description:text completed:boolean
```

This generated the necessary files, including:
- Task model
- Tasks controller
- Views
- Database migration
- Routes
- Test files

### 4. Database Migration

Executed:

```bash
rails db:migrate
```

This created the `tasks` table in PostgreSQL.

### 5. CRUD Functionality

Tested the application's basic CRUD operations:

- **Create** – Add new tasks.
- **Read** – View existing tasks.
- **Update** – Edit task information.
- **Delete** – Remove tasks.

### 6. Application Routing

Configured the homepage to display the task list using:

```ruby
root "tasks#index"
```

### 7. Running the Application

Started the Rails development server using:

```bash
rails server
```

Accessed the application through:

http://localhost:3000

## Project Structure

```text
first_rails_app/
├── app/
│   ├── controllers/
│   │   └── tasks_controller.rb
│   ├── models/
│   │   └── task.rb
│   └── views/
│       └── tasks/
├── config/
│   ├── database.yml
│   └── routes.rb
├── db/
│   └── migrate/
├── test/
├── Gemfile
└── README.md
```

## What I Learned

Throughout this OJT activity, I learned how to:

1. Set up a Ruby on Rails development environment.
2. Configure PostgreSQL as the database for a Rails application.
3. Connect a Rails project to a PostgreSQL database.
4. Generate scaffolds using Rails commands.
5. Perform database migrations.
6. Understand the basic MVC (Model-View-Controller) structure.
7. Implement CRUD operations using Rails scaffolding.
8. Configure application routes.
9. Run and test a Rails application locally.

## Conclusion

This OJT activity helped me understand the fundamentals of Ruby on Rails development, database configuration, and application structure. I successfully created a functional Task Manager application connected to PostgreSQL and tested its basic CRUD operations.

This project serves as a foundation for learning more advanced Rails concepts and improving web application development skills.
 67fd3794f79df812bd7181954dfcfb615a6a915b
