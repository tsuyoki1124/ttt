class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to country_messages_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, message_id: params[:message_id])
  end
end
