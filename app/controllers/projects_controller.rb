class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :create_location, only: [:create, :update]
  
  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.create(project_params)
    role = current_user.add_role(:owner, @project)
    current_user.users_projects.create(project: @project, role: role)
    @locations.each do |location|
      @project.locatables.create(location: location)
    end
    redirect_to projects_path
  end

  def update
    @project.update(project_params)
    @project.locatables.destroy_all
    @locations.each do |location|
      @project.locatables.create(location: location)
    end
    redirect_to projects_path
  end

  def index
    @projects = Project.all
  end

  def destroy
    p 1211111111
    p @project
    p 2222222222
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def create_location
    locations = params[:locations].split(/[\s,]+/)
    @locations = []
    locations.each do |locality|
      @location = Location.find_by(name: "#{locality}".downcase)
      @locations << @location
      if !@location.present?
        @location = Location.create(name: "#{locality}".downcase)
        @locations << @location
      end
    end
  end
end
