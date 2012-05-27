source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'mysql2'

gem 'devise'
gem 'cancan'
gem 'rolify'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'

  gem 'execjs'
  #gem 'therubyracer' seems to be broken on 64-bit linux
end

gem 'haml'
gem 'haml-rails'
#gem 'haml_coffee_assets'

gem 'jquery-rails'
gem 'rails-backbone'
gem 'facebox-rails'

# Using a fork below until this pull request allowing multiple column searches gets pulled in
# https://github.com/crowdint/rails3-jquery-autocomplete/pull/95
gem 'rails3-jquery-autocomplete', :git => 'git://github.com/slash4/rails3-jquery-autocomplete.git'

group :development, :test do
  gem 'capistrano'
  gem 'capistrano-unicorn'
  gem 'sqlite3'
  gem 'rake'

  #gem 'webrat'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'cucumber'
  gem 'factory_girl_rails'
  gem 'factory_girl'

  #gem 'autotest'
  #gem 'ZenTest'
  gem 'spork'
  gem 'watchr'

  gem 'annotate'
  #gem 'rails3-generators'
  gem 'turn', :require => false
  gem 'ruby-debug19', :platform => "ruby_19"
end
