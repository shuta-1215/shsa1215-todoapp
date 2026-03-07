class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build
  end

  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to board_task_path(@task.board, @task), notice: "コメントを投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end