
class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks
  def index
    @tasks = Current.user.tasks.includes(:category).order(created_at: :desc)
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Current.user.tasks.build
    @task.task_details.build
    @categories = Category.all
  end

  # GET /tasks/1/edit
  def edit
    @task.task_details.build if @task.task_details.empty?
    @categories = Category.all
  end

  # POST /tasks
  def create
    @task = Current.user.tasks.build(task_params)
    Rails.logger.debug "NESTED DETAILS: #{@task.task_details.map(&:description).inspect}"
    @categories = Category.all

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @task.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
    @categories = Category.all

    Rails.logger.debug "PARAMETERS: #{params.inspect}"

    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html do
        redirect_to tasks_path,
                    notice: "Task was successfully destroyed.",
                    status: :see_other
      end
      format.json { head :no_content }
    end
  end

  private

  # Only find tasks belonging to the logged-in user.
  def set_task
    @task = Current.user.tasks.find(params[:id])
  end

  # Only allow trusted parameters.
  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :completed,
      :category_id,
      task_details_attributes: [
        :id,
        :description,
        :_destroy
      ]
    )
  end
end
