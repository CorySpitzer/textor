class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @contacts = Contact.all
    @message = Message.new
    if params[:contact_id]
      @contact = Contact.find params[:contact_id]
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was sent!"
      redirect_to messages_path
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end

private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end

end
