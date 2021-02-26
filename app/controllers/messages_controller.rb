class MessagesController < ApplicationController
  def index
    @country = Country.all
  end
end
