class TasksController < ApplicationController

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to project_path(@task.project_id), notice: "Sucessfully Created"
		else
			render action: "new"
		end
	end	

	def update
		task = Task.find(params[:id])
		task.update_attributes(task_params)
		Notification.task_completed(task).deliver
		redirect_to :back, notice: "Sucessfully Completed Task"
	end	

	def mark_as_complete
		task = Task.find(params[:task_id])
		task.update_attributes(is_complete:true)
		Notification.task_completed(task).deliver
		redirect_to :back, notice: "Sucessfully Completed Task"
	end	

	def mark_as_incomplete
		task = Task.find(params[:task_id])
		task.update_attributes(is_complete:false)
		Notification.task_incomplete(task).deliver
		redirect_to :back, notice: "Sucessfully updated Task status"
	end

private

def task_params
	params[:task].permit(:title,:project_id,:is_complete,:due_date)
end	

end
