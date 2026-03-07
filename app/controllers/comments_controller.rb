class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task

  def new
    @comment = @task.comments.build
  end

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to board_task_path(@task.board, @task), notice: "コメントを投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
      @comment.destroy
      redirect_to board_task_path(@task.board, @task), notice: "コメントを削除しました", status: :see_other
  end

  private
  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end