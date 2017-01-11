source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

#[Daniel]--->
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
gem 'pg', '~> 0.19.0'
#--->

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

#[Daniel]--->
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
#gem 'turbolinks', '~> 5'
#--->

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#[Daniel]--->
gem 'haml', '~> 4.0', '>= 4.0.7'
#gem 'simple_form', '~> 3.3', '>= 3.3.1'
gem 'devise'

gem 'bootstrap-sass'
gem "autoprefixer-rails"
#--->


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  #[Daniel]--->
  gem 'pry'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'faker'
  #gem 'letter_opener', git: 'git://github.com/ryanb/letter_opener.git', branch: 'master'
  #gem 'thin'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  #--->

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  #--->
  gem 'guard',  require: false
  gem 'spring-commands-rspec'
  #gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'rb-fsevent',  require: false
  gem 'guard-rspec', require: false
  gem 'guard-livereload', require: false
  gem 'hirb'
  gem 'hirb-unicode'
  #--->
end

group :test do
  #--->
  gem 'capybara'

  # #Test your ActionMailer and Mailer messages with Capybara
  # gem 'capybara-email'

  # #A Capybara driver for headless WebKit to test JavaScript web apps
  # gem 'capybara-webkit'

  # #WebDriver is a tool for writing automated tests of websites.
  # #It aims to mimic the behaviour of a real user, and as such interacts with the HTML of the application.
  # gem 'selenium-webdriver'

  # #A helper for launching cross-platform applications in a fire and forget manner.
  # #ex: save_and_open_page
  # gem 'launchy'

  # #Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic, accurate tests.
  # gem 'vcr'

  # #Library for stubbing and setting expectations on HTTP requests in Ruby.
  # gem 'webmock'

  # #Fabrication is an object generation framework for Ruby.
   gem 'fabrication'

  # #Shoulda Matchers provides RSpec- and Minitest-compatible one-liners that test common Rails functionality.
  # gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'

  # #Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.
  # gem 'database_cleaner'
  #--->

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
