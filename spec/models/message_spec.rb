require 'rails_helper'

describe Message, vcr: true do
  it { should have_and_belong_to_many :contacts}
  # it { should validate_presence_of :from}
  # it { should validate_presence_of :body}

  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5039465235')
    expect(message.save).to be false
  end

  it 'gives an error with an invalid number' do
    message = Message.new(body: 'hi', to: '1113334', from: '5039465235')
    message.save
    expect(message.errors[:base]).to eq ["The 'To' number 1113334 is not a valid phone number."]
  end

end
