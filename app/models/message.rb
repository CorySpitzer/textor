class Message < ActiveRecord::Base
  # validates_presence_of :to
  # validates_presence_of :from
  # validates_presence_of :body

  before_create :send_message

  # def initialize(attributes)
  #   @to = attributes['to']
  #   @from = attributes['from']
  #   @body = attributes['body']
  #   @status = attributes['status']
  # end

private


  def send_message
    response = RestClient::Request.new(
      method: :post,
      url: "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
      user: ENV['TWILIO_ACCOUNT_SID'],
      password: ENV['TWILIO_AUTH_TOKEN'],
      payload: { Body: body,
                 To: to,
                 From: from }
    ).execute
  end
end