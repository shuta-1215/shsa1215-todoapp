class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board

  def new
    @task = @board.task.build
  end

  def create
    @task = @board.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to board_path(@board), notice: "タスクを追加しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_board
    @board = Board.find(params[:board_id])
  end

  def task_params
    prams.require(:task).permit(:title, :content, :deadline)
  end
end