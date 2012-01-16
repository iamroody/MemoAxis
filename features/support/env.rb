require 'capybara' 
require 'capybara/dsl' 
require 'capybara/cucumber'

Capybara.default_driver = :selenium
Capybara.default_wait_time = 20
Capybara.default_selector = :css
Capybara.app_host = "http://localhost:3000"
World(Capybara) 

