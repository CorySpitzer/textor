require 'rails_helper'

describe 'the root page path' do
  it 'visits the root path' do
    visit root_path
    expect(page).to have_content 'Messages'
  end
end
