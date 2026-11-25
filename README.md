# Task Manager – Ruby on Rails OJT Project

## Project Overview

This project is a simple Task Manager web application developed using Ruby on Rails during my On-the-Job Training (OJT).

The application allows users to create, view, edit, and delete tasks. It also supports task categorization through a relationship between the Task and Category models. It uses PostgreSQL as its database management system and Tailwind CSS for styling the user interface.

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
│   │   ├── category.rb
│   │   └── task.rb
│   └── views/
│       ├── layouts/
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
13. Create model associations using Active Record.
14. Establish one-to-many relationships between database tables.
15. Use foreign keys to connect related records.
16. Apply model validations to maintain data integrity.
17. Use strong parameters to permit associated model attributes.
18. Display related model data in Rails views using ERB.

## Conclusion

During Day 6, I successfully set up a Ruby on Rails application, configured PostgreSQL as its database, and implemented basic CRUD functionality for the Task Manager.

During Day 7, I continued developing the same application by integrating Tailwind CSS, customizing the homepage and task forms, improving the task details page, and testing the CRUD operations again.

During Day 8, I expanded the application by introducing a Category model and establishing a relationship between Category and Task. I also implemented model validations, database migrations, a category selection dropdown, and the display of related category information on the main page and task details page.

These activities helped strengthen my understanding of Ruby on Rails, database configuration, MVC architecture, Active Record associations, data validation, frontend styling, application testing, and Git version control.

This project serves as a foundation for learning more advanced Rails concepts and improving my web application development skills.
