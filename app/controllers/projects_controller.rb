class ProjectsController < ApplicationController

	before_action :authenticate_user!

	def index
		@projects = current_user.projects #.order('start_date DESC') #Project.order('start_date DESC')
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_param)
		@project.user_id = current_user.id
		if @project.save
			redirect_to projects_path
		else
			render action: "new"
		end
	end

	def show
		@project = Project.find(params[:id])
		@task = Task.new
		

	end	

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_param)
			redirect_to project_path(@project)
		else
			render action: "edit"
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path

	end


private

	def project_param
		params[:project].permit(:name, :client_id,:start_date,:end_date,:description,:status, category_ids: [])
	end

end
