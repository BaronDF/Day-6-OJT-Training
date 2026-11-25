# Task Manager – Ruby on Rails OJT Project

## Project Overview

This project is a simple Task Manager web application developed using Ruby on Rails during my On-the-Job Training (OJT).

The application allows users to create, view, edit, and delete tasks. It uses PostgreSQL as its database management system and Tailwind CSS for styling the user interface.

## Technologies Used

- **Ruby** – Programming language
- **Ruby on Rails 8.1.4.1** – Web application framework
- **PostgreSQL 18** – Database management system
- **Tailwind CSS** – CSS framework for styling
- **Bundler** – Ruby gem dependency manager
- **Visual Studio Code** – Code editor
- **PowerShell** – Command-line interface
- **Git and GitHub** – Version control and project repository

---

# Day 6 – Task Manager Setup and CRUD Implementation

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

---

# Day 7 – Task Manager Customization and Tailwind CSS Integration

## Activities Completed

### 1. Tailwind CSS Installation

Installed Tailwind CSS for the Rails application using:

```bash
bundle add tailwindcss-rails
```

Then executed:

```bash
bundle exec rails tailwindcss:install
```

This configured Tailwind CSS and generated the necessary files for styling the application.

### 2. Homepage Customization

- Redesigned the Task Manager homepage using Tailwind CSS.
- Applied a dark-themed interface with a slate-colored background.
- Added a welcome section and improved task display.
- Styled buttons, task cards, and the empty-state message.

### 3. Form Customization

Customized the New Task and Edit Task forms.

- Styled text fields and description areas.
- Improved labels, spacing, and padding.
- Added focus effects to form inputs.
- Styled the checkbox and submit button.
- Improved the overall form layout.

### 4. Task Details Page Customization

Redesigned the Show Task page.

- Added a task details section.
- Displayed task completion status using badges.
- Improved the description layout.
- Styled the Edit, Back to Tasks, and Delete Task buttons.
- Added a browser confirmation prompt before deleting a task.

### 5. Controller Customization

Updated the `TasksController` index action to display the newest tasks first:

```ruby
def index
  @tasks = Task.order(created_at: :desc)
end
```

### 6. CRUD Functionality Testing

Performed additional tests to verify that the customized application continued to work correctly.

- **Create** – Successfully created a test task.
- **Read** – Viewed the task details.
- **Update** – Modified the task title and description.
- **Delete** – Deleted the test task and verified the confirmation prompt.

All four CRUD operations were successfully tested.

### 7. Git and GitHub Updates

Used Git commands through the VS Code terminal to save and upload the Day 7 changes.

```bash
git add .
git commit -m "Day 7 Task Manager styled with Tailwind CSS"
git push origin main
```

Successfully pushed the updated project to the `main` branch of the GitHub repository.

---

## Project Structure

```text
first_rails_app/
├── app/
│   ├── assets/
│   │   ├── builds/
│   │   └── tailwind/
│   │       └── application.css
│   ├── controllers/
│   │   └── tasks_controller.rb
│   ├── models/
│   │   └── task.rb
│   └── views/
│       ├── layouts/
│       └── tasks/
├── config/
│   ├── database.yml
│   └── routes.rb
├── db/
│   └── migrate/
├── test/
├── Gemfile
├── Gemfile.lock
├── Procfile.dev
└── README.md
```

## What I Learned

Throughout these OJT activities, I learned how to:

1. Set up a Ruby on Rails development environment.
2. Configure PostgreSQL as the database for a Rails application.
3. Connect a Rails project to a PostgreSQL database.
4. Generate scaffolds using Rails commands.
5. Perform database migrations.
6. Understand the basic MVC (Model-View-Controller) structure.
7. Implement CRUD operations using Rails scaffolding.
8. Configure application routes and customize controller actions.
9. Integrate Tailwind CSS into a Rails application.
10. Style Rails views, forms, buttons, and layouts using Tailwind CSS.
11. Test CRUD functionality after customizing the application.
12. Use Git commands to commit and push project updates to GitHub.

## Conclusion

During Day 6, I successfully set up a Ruby on Rails application, configured PostgreSQL as its database, and implemented basic CRUD functionality for the Task Manager.

During Day 7, I continued developing the same application by integrating Tailwind CSS, customizing the homepage and task forms, improving the task details page, and testing the CRUD operations again.

These activities helped strengthen my understanding of Ruby on Rails, database configuration, MVC architecture, frontend styling, application testing, and Git version control.

This project serves as a foundation for learning more advanced Rails concepts and improving my web application development skills.
