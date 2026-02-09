class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, notice: "ボードを作成しました"
    else
      flash.now[:error] = 'ボードの作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path, notice: "削除しました", status: :see_other
  end

  private
  def ensure_correct_user
    @board = Board.find(params[:id])
    if @board.user_id != current_user.id
      redirect_to board_path, alert: "権限がありません"
    end
  end

  def board_params
    params.require(:board).permit(:title, :content)
  end
end
