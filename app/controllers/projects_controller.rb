class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    if request.xhr?
      render :show
    end
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

   def search
    @project = Project.find_by(title:params[:title])
    redirect_to project_path(@project)
   end


  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :image, rewards_attributes: [:dollar_amount, :description])
  end
end
