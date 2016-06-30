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

    @review = Review.new
    @reviews = @project.reviews.order("created_at desc")

    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def list
    if current_user
      @projects = current_user.projects
    end
  end
end
