require 'rails_helper'

describe 'the new message form', vcr: true do
  it 'displays a form for adding a message' do
    # visit new_contact_path
    # fill_in 'Name', with: 'Bob'
    # fill_in 'Cell number', with: '5039465235'
    # click_on 'Create Contact'
    # expect(page).to have_content 'Bob'
    Contact.create name: 'Bob', cell_number: '5039465235'
    visit contacts_path
    click_on 'Text Bob'
    fill_in 'From', with: '5039465235'
    fill_in 'Body', with: 'Bob Test!'
    click_on 'Send Message'
    expect(page).to have_content "Your message was sent!"
  end
end
