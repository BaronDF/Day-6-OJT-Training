# Task Manager – Ruby on Rails OJT Project

## Project Overview

This project is a Task Manager web application developed using Ruby on Rails during my On-the-Job Training (OJT).

The application allows users to create, view, edit, and delete tasks, organize them using categories, and add additional task details through nested forms.

It also includes user authentication and account-based task ownership. Users can register, log in, and log out, while each user can access and manage only their own tasks through a personalized dashboard.

The application uses PostgreSQL as its database management system and Tailwind CSS for styling the user interface.

## Technologies Used

- **Ruby 4.0.9** – Programming language
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

# Day 8 – Model Relationships and Validations

## Activities Completed

### 1. Category Model Creation

Generated a new Category model using:

```bash
rails generate model Category name:string
```

This created the Category model and its corresponding database migration.

### 2. Model Relationships

Established a one-to-many relationship between Category and Task.

Updated `app/models/category.rb`:

```ruby
class Category < ApplicationRecord
  has_many :tasks, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
```

Updated `app/models/task.rb`:

```ruby
class Task < ApplicationRecord
  belongs_to :category, optional: true

  validates :title, presence: true
end
```

These associations allow:
- One Category to have many Tasks.
- Each Task to belong to one Category.
- Existing tasks to remain valid even if they do not have a category.

### 3. Database Migration and Foreign Key

Generated a migration to add a category reference to the tasks table:

```bash
rails generate migration AddCategoryToTasks category:references
```

Configured the migration to allow existing tasks to have no category:

```ruby
class AddCategoryToTasks < ActiveRecord::Migration[8.1]
  def change
    add_reference :tasks, :category, null: true, foreign_key: true
  end
end
```

Executed the migration using:

```bash
rails db:migrate
```

This added the `category_id` column and foreign key to the tasks table.

### 4. Model Validations

Added validations to ensure data integrity.

- Category names must be present.
- Category names must be unique.
- Task titles must be present.

These validations help prevent incomplete or duplicate records.

### 5. Controller Updates

Updated the `TasksController` to load available categories when creating and editing tasks.

Also updated the strong parameters to permit the `category_id` attribute:

```ruby
def task_params
  params.expect(task: [ :title, :description, :completed, :category_id ])
end
```

Loaded categories when rendering the forms again after validation errors to keep the Category dropdown available.

### 6. Category Dropdown Integration

Updated the shared task form in:

`app/views/tasks/_form.html.erb`

Added a Category dropdown using Rails' `collection_select` helper.

This allows users to select a category when creating or editing a task.

### 7. Displaying Related Category Data

Updated the application views to display the associated category.

**Main Tasks Page**
- Added the Category badge to each task card.
- Displayed the selected category alongside the task title, description, and status.
- Displayed "Uncategorized" when a task has no category.

**Task Details Page**
- Added a Category section.
- Displayed the category associated with the selected task.
- Used a styled badge consistent with the application's dark theme.

### 8. Testing and Verification

Tested the Category and Task relationship and verified the following:

- Successfully created categories.
- Successfully created tasks with selected categories.
- Confirmed that the selected category appears on the task details page.
- Confirmed that categories appear on the main Tasks page.
- Successfully edited tasks and changed their categories.
- Verified that task title validation prevents submission without a title.
- Confirmed that the Category dropdown remains available when the form is displayed again after a validation error.

### 9. Git and GitHub Updates

Committed and pushed the Day 8 changes to the existing GitHub repository.

Used Git commands to stage, commit, synchronize, and push the updates:

```bash
git add .
git commit -m "Day 8 Add Category and Task model relationships"
git pull --rebase origin main
git push origin main
```

Successfully synchronized the local project with the remote repository and uploaded the Day 8 changes to the `main` branch.

---

# Day 9 – Authentication and Forms

## Activities Completed

### 1. Authentication Setup

Used the Rails authentication generator to create the necessary authentication-related files.

Generated components included:
- User model
- Session model
- Current session model
- Sessions controller
- Passwords controller
- Authentication concern
- Login view
- Password-related views
- Database migrations for users and sessions

### 2. Database Migration

Executed the database migrations to create the necessary tables for authentication.

Created:
- Users table
- Sessions table

These tables allow the application to store user account information and manage authenticated sessions.

### 3. User Registration

Created a registration controller and registration form.

The registration form includes:
- Full name
- Email address
- Password
- Password confirmation
- Create Account button

Implemented the registration functionality so users can create their own accounts.

After successful registration, the user is automatically logged in and redirected to the Task Manager homepage.

### 4. User Login

Customized the login page using Tailwind CSS.

Added:
- Email address field
- Password field
- Forgot password link
- Sign In button
- Link to the registration page

Implemented login functionality using the user's email address and password.

### 5. User Logout

Implemented logout functionality using the Rails session system.

Added a Log Out button to the navigation bar for authenticated users.

When users log out, their current session is terminated and they are redirected to the login page.

### 6. Authentication Navigation and Flash Messages

Updated the application layout to include navigation links based on the user's authentication status.

**When Logged In**
- Displays a personalized welcome message.
- Shows the Log Out button.

**When Logged Out**
- Shows the Log In link.
- Shows the Register link.

Also added flash message displays for notices and alerts to provide feedback to users.

### 7. Protected Routes

Used the authentication concern to require users to be authenticated before accessing protected pages.

Configured the registration and login actions to allow unauthenticated access.

Protected the Task Manager routes so logged-out users are redirected to the login page when attempting to access them.

### 8. Login and Registration Page Customization

Styled the login and registration pages using Tailwind CSS.

- Applied a consistent dark-themed design.
- Used matching card layouts, spacing, and borders.
- Styled the email and password fields.
- Added focus effects to the input fields.
- Styled the submit buttons and navigation links.
- Made both pages visually consistent with the existing Task Manager interface.

### 9. Testing and Verification

Tested the authentication system and verified the following:

- Successfully registered a new user account.
- Confirmed that users are automatically logged in after registration.
- Successfully logged out of the application.
- Successfully logged in using the registered account.
- Confirmed that the navigation bar changes depending on authentication status.
- Verified that logged-out users are redirected to the login page when accessing `/tasks`.

All the main authentication functions were successfully tested.

### 10. Git and GitHub Updates

Prepared the Day 9 changes for version control using Git.

The project continues to use the same GitHub repository and the `main` branch.

---

# Day 10 – Nested Forms, Model Callbacks, and User Ownership

## Activities Completed

### 1. TaskDetail Model Creation

Generated a TaskDetail model to allow each task to contain additional details.

Used:

```bash
rails generate model TaskDetail task:references description:text
```

This generated the model and database migration.

### 2. Task and TaskDetail Relationship

Established a one-to-many relationship between Task and TaskDetail.

Updated `app/models/task.rb`:

```ruby
class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  has_many :task_details, dependent: :destroy

  accepts_nested_attributes_for :task_details,
    allow_destroy: true,
    reject_if: :all_blank

  validates :title, presence: true
end
```

Updated `app/models/task_detail.rb`:

```ruby
class TaskDetail < ApplicationRecord
  belongs_to :task

  before_validation :normalize_description

  validates :description, presence: true

  private

  def normalize_description
    self.description = description.strip if description.present?
  end
end
```

These associations allow:
- One Task to have multiple TaskDetails.
- Each TaskDetail to belong to one Task.
- TaskDetails to be automatically deleted when their associated task is deleted.

### 3. Nested Forms

Updated the shared task form to support nested TaskDetail attributes.

Used Rails' `fields_for` helper to display additional detail fields within the task form.

Implemented:
- Adding task details.
- Editing existing task details.
- Deleting existing task details using the `_destroy` attribute.
- Rejecting nested records when all their fields are blank.

### 4. Model Callback

Implemented a `before_validation` callback in the TaskDetail model.

The callback automatically removes unnecessary leading and trailing whitespace from task detail descriptions before validation.

This helps keep stored descriptions consistent.

### 5. Testing Nested Forms and Callbacks

Tested the nested form functionality through the browser.

Verified that:
- Task details can be added.
- Existing task details can be edited.
- Existing task details can be deleted.
- Nested task details are associated with the correct task.

Also tested nested attributes through the Rails console.

### 6. User Name and Registration Updates

Added a `name` attribute to the User model through a database migration.

Updated the registration form and controller to accept the user's full name.

Updated the navigation bar to display the logged-in user's name.

### 7. Task Ownership and User Associations

Established a one-to-many relationship between User and Task.

Updated `app/models/user.rb`:

```ruby
has_many :tasks, dependent: :destroy
```

Updated `app/models/task.rb` to require an associated user:

```ruby
belongs_to :user
```

Added a `user_id` reference to the tasks table and migrated the database.

Existing tasks were assigned to the first registered user before making the `user_id` column required.

### 8. User-Specific Task Access

Updated the TasksController to scope task operations to the currently authenticated user.

Examples:

```ruby
def index
  @tasks = Current.user.tasks.includes(:category).order(created_at: :desc)
end
```

```ruby
def set_task
  @task = Current.user.tasks.find(params[:id])
end
```

Updated task creation to associate new tasks with the logged-in user.

This ensures that users can only view, edit, update, and delete tasks belonging to their own accounts.

### 9. Personalized Dashboard

Updated the application layout and task index page to display the logged-in user's name.

The dashboard now includes a personalized welcome message and displays the current user's tasks.

### 10. Testing and Verification

Tested the updated application and verified that:

- Users can register with their names.
- The navigation bar displays the logged-in user's name.
- The dashboard displays a personalized welcome message.
- Users can create tasks while logged in.
- Tasks are associated with their respective users.
- Existing tasks were assigned to the first registered user.
- A second user cannot access another user's task through its URL.
- Unauthorized task lookup attempts return `ActiveRecord::RecordNotFound`.

These tests confirmed that user-specific task ownership and access restrictions are working.

### 11. Git and GitHub Updates

Committed the Day 10 changes using Git.

```bash
git add .
git commit -m "Day 10 Add nested task details and user ownership"
git pull --rebase origin main
git push origin main
```

Successfully committed and pushed the Day 10 changes to the `main` branch of the GitHub repository.

Commit: `9425534`

---

## Project Structure

```text
Ruby-on-Rails-Task-Manager-OJT/
├── app/
│   ├── controllers/
│   │   ├── concerns/
│   │   │   └── authentication.rb
│   │   ├── application_controller.rb
│   │   ├── passwords_controller.rb
│   │   ├── registrations_controller.rb
│   │   ├── sessions_controller.rb
│   │   └── tasks_controller.rb
│   ├── models/
│   │   ├── category.rb
│   │   ├── current.rb
│   │   ├── session.rb
│   │   ├── task.rb
│   │   ├── task_detail.rb
│   │   └── user.rb
│   └── views/
│       ├── layouts/
│       │   └── application.html.erb
│       ├── passwords/
│       ├── registrations/
│       │   └── new.html.erb
│       ├── sessions/
│       │   └── new.html.erb
│       └── tasks/
│           ├── _form.html.erb
│           ├── _task.html.erb
│           ├── index.html.erb
│           └── show.html.erb
├── config/
│   ├── database.yml
│   └── routes.rb
├── db/
│   ├── migrate/
│   └── schema.rb
├── test/
│   ├── fixtures/
│   └── models/
├── Gemfile
├── Gemfile.lock
├── Procfile.dev
└── README.md
```

## What I Learned

Throughout these OJT activities, I gained practical experience with:

1. Setting up a Ruby on Rails development environment.
2. Configuring PostgreSQL as the database for a Rails application.
3. Generating scaffolds using Rails commands.
4. Performing database migrations.
5. Understanding the Model-View-Controller (MVC) architecture.
6. Implementing CRUD operations.
7. Configuring application routes and controller actions.
8. Integrating Tailwind CSS into a Rails application.
9. Styling Rails views, forms, buttons, and layouts.
10. Testing CRUD functionality after customizing the application.
11. Using Git and GitHub for version control.
12. Creating model associations using Active Record.
13. Establishing one-to-many relationships between database tables.
14. Using foreign keys to connect related records.
15. Applying model validations to maintain data integrity.
16. Using strong parameters to permit associated model attributes.
17. Displaying related model data in Rails views using ERB.
18. Implementing user authentication using Rails.
19. Using `has_secure_password` for password authentication.
20. Understanding sessions and cookies in Rails.
21. Building registration and login forms using Rails form helpers.
22. Implementing login and logout functionality.
23. Using authentication concerns and `before_action` to protect routes.
24. Displaying flash messages using notices and alerts.
25. Working with nested forms and nested attributes.
26. Implementing model callbacks to normalize data.
27. Associating records with individual users.
28. Restricting database queries to the currently authenticated user.
29. Testing user-specific access restrictions.

## Conclusion

From Day 6 to Day 10, I developed the Task Manager application step by step using Ruby on Rails and PostgreSQL.

I started by setting up the development environment and implementing basic CRUD functionality. I then improved the interface using Tailwind CSS, introduced categories and Active Record associations, and implemented model validations.

During Day 9, I added user authentication, including registration, login, logout, and protected routes.

For Day 10, I expanded the application by implementing nested forms, model callbacks, personalized dashboards, and user-specific task ownership. I also tested that users cannot access tasks belonging to other accounts.

This project strengthened my understanding of Ruby on Rails, database management, MVC architecture, Active Record, authentication, nested attributes, model callbacks, data validation, frontend styling, and Git version control.

It also provided practical experience in developing a more complete web application while following a structured OJT learning process.

## Repository

**GitHub:** https://github.com/BaronDF/Ruby-on-Rails-Task-Manager-OJT

## Live Demo

Deployment and live demo preparation are the next steps.
