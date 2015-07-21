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
    if create_group_message(messages_params)
      redirect_to messages_path
    else
      flash[:alert] = "Error: some messages were not sent."
      redirect_to :back
    end

  end

  def create_group_message(messages_params)
    is_valid_message = true
    messages_params.each do |message_params|
      message = make_message(message_params)
      unless message.save
        is_valid_message = false
      # else
      #   messages << message
      end
    end
    is_valid_message
  end

  def show
    @message = Message.find(params[:id])
  end

private

  def make_message(params)
    Message.new(params)
  end

  def form_params
    params.require(:message).permit({:to => []}, :from, :body)
  end

  def messages_params
    form_params[:to].select { |cell_number| cell_number != "" }
                    .map { |cell_number|
                          { :to => cell_number,
                            :from => form_params[:from],
                            :body => form_params[:body] } }
  end

end
