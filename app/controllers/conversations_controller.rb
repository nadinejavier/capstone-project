
class ConversationsController < ApplicationController

  def index
    @conversations = current_user.mailbox.conversations
    @receipts = current_user.mailbox.receipts
  end

  def show 
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

   def create
    recipient = User.find(params[:user_id])
    receipt   = current_user.send_message(recipient, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
  end

end