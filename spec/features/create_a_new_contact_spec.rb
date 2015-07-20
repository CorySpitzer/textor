require 'rails_helper'

describe 'the new contact form' do
  it 'adds a contact' do
    visit new_contact_path
    fill_in 'Name', with: 'Bob'
    fill_in 'Cell number', with: '5039465235'
    click_on 'Create Contact'
    expect(page).to have_content 'Bob'
  end
end
