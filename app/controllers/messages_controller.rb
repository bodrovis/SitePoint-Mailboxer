class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_recipient

  def new
  end

  def create
    current_user.send_message(@recipient, params[:message][:body], params[:message][:subject])
    flash[:success] = "Message has been sent!"
    redirect_to conversations_path(box: 'sent')
  end

  private

  def get_recipient
    @recipient = User.find(params[:recipient])
  end
end