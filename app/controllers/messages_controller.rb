class MessagesController < ApplicationController
  def index
    @name = Country.all
    @message = Message.new
    @country = Country.find(params[:country_id])
  end

  def create
    @country = Country.find(params[:country_id])
    @message = @country.messages.new(message_params)
    if @message.save
      redirect_to country_messages_path(@country)
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :text).merge(user_id: current_user.id)
  end
end
