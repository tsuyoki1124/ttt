class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    @message = Message.all
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, message_id: params[:message_id])
  end
end
