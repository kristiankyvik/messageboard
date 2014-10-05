
class ClientsController < ApplicationController
  def index
    @list = Board.find(1).messages
    render :index, :layout => false
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
    @list = board.messages

    render :nothing => true
  end


  def upvoteQuestion
    target_id = params[:target_id]
    @list = Board.find(1).messages
    message = @list.find(target_id)
    message.ranking += 1
    message.save!
    @list = @list.map { |n| [n.content, n.ranking] }
    Pusher['the_channel'].trigger('new_question', {
          message: @list
        })
    redirect_to( action: 'index', controller: 'clients')
  end

  def downvoteQuestion
    target_id = params[:target_id]
    @list = Board.find(1).messages
    message = @list.find(target_id)
    message.ranking -= 1
    message.save!
    @list = @list.map { |n| [n.content, n.ranking] }
    Pusher['the_channel'].trigger('new_question', {
          message: @list
        })
    redirect_to( action: 'index', controller: 'clients')
  end

end
