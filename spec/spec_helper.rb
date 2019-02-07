require 'capybara/rspec'
require 'pg'
require 'selenium'
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'rspec'
require 'setup_database'
require './bookmark_manager_app'

require File.join(File.dirname(__FILE__), '..', 'bookmark_manager_app.rb')

ENV['ENV'] = 'test'
Capybara.app = BookmarkManager

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_database
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop?\e[0m"
    puts "\e[33mIt will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
