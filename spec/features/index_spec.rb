require 'spec_helper'

feature 'index page' do
  scenario 'displays bookmark manager title' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end
