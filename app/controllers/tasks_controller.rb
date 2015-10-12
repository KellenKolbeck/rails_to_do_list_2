class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task=@list.tasks.new
    # render :new
  end
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save

      redirect_to list_path(@task.list)
    else
      render :new
  end
  def edit
    @list = List.find(params[:list_id])
    @task= Task.find(params[:id])

    render :edit
  end
  def update
    @list= List.find(params[:list_id])

    @task= Task.find(params[:id])
    binding.pry
    if @task.update(description: params[:description])
      binding.pry
      redirect_to list_path(@list)
    else
      render :edit
    end

  end

end

private
  def task_params
    params.require(:task).permit(:description)
  end
end
