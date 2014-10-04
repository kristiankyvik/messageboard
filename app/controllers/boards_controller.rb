class BoardsController < ApplicationController
  
  def index
    user = User.find(params[:user_id])
    @boards = user.boards
  end

  def new
    @board = Board.new
  end

  def create
    user = current_user
    board = user.boards.new(board_params)
    board.save
    redirect_to( action: 'index', controller: 'boards', user_id: params[:user_id])
  end

  # def show
  # end

  # def edit
  # end

  # def update
  # end

  private
  def board_params
      params.require(:board).permit(:title, :topic)
  end
end
