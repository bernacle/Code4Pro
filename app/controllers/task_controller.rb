class TaskController < ApplicationController

  before_action :authenticate_user!

  def show
    project = Project.find(params[:project_id])
    @tasks = project.tasks.order(:tag)


    joined = false

    if current_user && current_user.projects
      joined = current_user.projects.include?(project) #include? veryfies if that specific project is on the projects of current user
    end

    if joined
      @task = @tasks.find(params[:id])

      @next_task = @task.next
      @prev_task = @task.prev
    else
      flash[:notice] = "No permission to this!"
      redirect_to project
    end

  end
end
