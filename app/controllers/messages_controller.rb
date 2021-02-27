class MessagesController < ApplicationController
  before_action :name

  def index
    @message = Message.new
    @country = Country.find(params[:country_id])
    @messages = @country.messages.includes(:user)
  end

  def create
    @country = Country.find(params[:country_id])
    @message = @country.messages.new(message_params)
    if @message.save
      redirect_to country_messages_path(@country)
    else
      @messages = @country.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def name
    @name = Country.all
  end
end
