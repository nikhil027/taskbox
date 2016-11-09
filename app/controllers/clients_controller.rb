class ClientsController < ApplicationController

	before_action :authenticate_user!

	def index
		@clients = current_user.clients #Client.where('user_id = ?',current_user.id) #Client.all
	end
	

	def new
		@client = Client.new 
	end

	def create
		@client = Client.new(client_param)
		@client.user_id = current_user.id
		if @client.save
			redirect_to clients_path
		else
			render action: "new"
		end
	end

	def show
		begin
		@client = current_user.clients.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		redirect_to clients_path, notice: "Record not found"
	end
=begin	
		@projects = Project.where('client_id = ?',@client.id)
		@projects_new = @client.all_new_projects
		@projects_ongoing = @client.all_ongoing_projects
		@projects_completed = @client.all_completed_projects



=begin		
		@projects_new = Project.where('client_id = ? AND status = ?',@client.id,"new")
		@projects_ongoing = Project.where('client_id = ? AND status = ?',@client.id,"on-going")
		@projects_completed = Project.where('client_id = ? AND status = ?',@client.id,"completed")
=end	

	end

	def edit
		@client = Client.find(params[:id])
	end

	def update
		@client = Client.find(params[:id])
		if @client.update_attributes(client_param)
			redirect_to client_path(@client)
		else
			render action: "edit"
		end
	end

	def destroy
		@client = Client.find(params[:id])
		@client.destroy
		redirect_to clients_path

	end

	def export
		@clients = current_user.clients
	end

	def export_client_details
		@client = Client.find(params[:client_id])
	end




	
private

	def client_param
		params[:client].permit(:name, :mobile, :website, :company, :email)
	end

end
