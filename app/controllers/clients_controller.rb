
class ClientsController < ApplicationController
  def index
    @list = Board.find(1).messages
  end


  def getQuestion
    text = params[:question]
    board_id = 1
    board = Board.find(1)
    board.messages.create(content: text, ranking: 1)
    list = board.messages
    list = list.map { |n| [n.content, n.ranking] }
    Pusher['the_channel'].trigger('new_question', {
          message: list
        })
    render :nothing => true
  end

  # def voteQuestion
  #   target_id = params[:target_id]
  #   list = Board.find(1).messages
  #   ranking = list.find(target_id).ranking
  #   ranking += 1 
  #   ranking.save!
  #   list = list.map { |n| [n.content, n.ranking] }
  #   Pusher['the_channel'].trigger('new_question', {
  #         message: list
  #       })
  #   @list = board.messages

  #   render :nothing => true
  # end

end
