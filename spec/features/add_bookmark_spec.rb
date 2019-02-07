require 'spec_helper'

feature 'Adding a bookmark' do
  scenario 'can be done through a form' do
    visit '/'
    click_link 'Add Bookmark'
    fill_in 'url', with: 'http://www.makersacademy.com'
    click_button 'Add'
    expect(page).to have_content 'http://www.makersacademy.com'
  end
end
