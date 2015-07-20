require 'rails_helper'

describe 'the new message form' do
  it 'displays a form for adding a message' do
    visit new_message_path
    fill_in 'To', with: '5033136555'
    fill_in 'From', with: '5039465235'
    # save_and_open_page
    expect(page).to have_content "From"
  end
end
