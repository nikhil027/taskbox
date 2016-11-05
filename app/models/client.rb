class Client < ActiveRecord::Base

	has_many :projects

	belongs_to :user

	validates_presence_of :name, :email, :mobile
	validates_numericality_of :mobile
	validates_length_of :mobile, is: 10
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_uniqueness_of :email

	def details
		"#{name} - #{company}"
	end

	def all_new_projects
		Project.where('client_id = ? AND status = ?', self.id, "new")
	end

	def all_ongoing_projects
		Project.where('client_id = ? AND status = ?', self.id, "on-going")
	end

	def all_completed_projects
		Project.where('client_id = ? AND status = ?', self.id, "completed")
	end

	def tasks_of_clients
		task_arr = []
		self.projects.each do |project|
			project.tasks.each do |task|
				task_arr.push(task)
			end
		end
	return task_arr	
	end


end
