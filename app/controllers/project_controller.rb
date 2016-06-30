class ProjectController < ApplicationController

  before_action :authenticate_user!, only: :list

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks.order(:tag)

    @joined = false

    if current_user && current_user.projects
      @joined = current_user.projects.include?(@project) #include? veryfies if that specific project is on the projects of current user
    end

    @users = @project.users.order("created_at DESC").first(10)
  end

  def list
    if current_user
      @projects = current_user.projects
    end
  end
end
