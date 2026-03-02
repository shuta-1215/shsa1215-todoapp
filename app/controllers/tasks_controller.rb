class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def show
    @task = @board.tasks.find(params[:id])
  end

  def new
    @task = @board.tasks.build
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

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to board_task_path(@board, @task), notice: "タスクを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to board_path(@board), notice: "タスクを削除しました", status: :see_other
  end

  private
  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_task
    @task = @board.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :eyecatch)
  end
end