class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[ show  edit update destroy ]
  before_action :set_video
  before_action :set_tweet

  # GET /projects or /projects.json
  def index
    @projects = current_user.projects
    if params[:q] && !params[:q].empty?
      @projects = @projects.search(params[:q].downcase)
    end
    if params[:id] && !params[:id].empty?
      @tweet = Feed.call(params[:id].downcase)
    end
  end

  # GET /projects/1 or /projects/1.json
  def show
    @task = @project.tasks.build
  end

  # GET /projects/new
  def new
    @project = current_user.projects.build
  end

  # GET /projects/1/edit
  def edit
    # Assuming when the project is edited this method is called
    # can I just call my observer class.method here?
    # and if so how would I do that if the other class is in
    # ../observer/project_observer.rb
  end

  # POST /projects or /projects.json
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # getting the projects based on id or name of the project
  def set_project
    @project = current_user.projects.find_by_id(params[:id]) || current_user.projects.find_by_name(params[:name])
  end

  # getting the API response from youtube
  def set_video
    @video = YouTube::Call.instance.video.html_safe
  end

  # getting the API response from twitter
  def set_tweet
    @tweet = Feed.call("rubyonrails".downcase)
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :date_due, :description)
  end
end
