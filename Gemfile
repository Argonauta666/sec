source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.1.4"

# Use postgresql as the database for Active Record
gem "pg", "~> 0.18"
gem "pg_search"

# Use Puma as the app server
gem "puma", "~> 3.7"

# Error reporting
gem "sentry-raven"

# Use SCSS for stylesheets
gem "foundation-rails", ">= 6" # Use Foundation for grids and other styles
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0" # Use Uglifier as compressor for JavaScript assets

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"

# Autocomplete select menus
gem "select2-rails"

# Redis for caching
gem "redis", "~> 3.0"
gem "redis-rails"

# Pagination
gem "kaminari"

# File attachments
gem "carrierwave"
gem "mini_magick"

# Web requests
gem "httparty"

# Slugging/permalinks
gem "friendly_id"

# HTML to PDF
gem "wicked_pdf"

# Feature flipping
gem "flipper", github: "jnunemaker/flipper"

# ActiveJob backend
gem "delayed_job_active_record"

# Content administration
gem "active_material", github: "vigetlabs/active_material"
gem "activeadmin"
gem "acts-as-taggable-on", "~> 5.0"
gem "ckeditor"
gem "devise"
gem "devise_invitable"
gem "font-awesome-rails"
gem "react-rails"
gem "reverse_markdown"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]

  # Testing
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", "~> 2.13"
  gem "factory_girl_rails"
  gem "rspec-core"
  gem "rspec-rails"
  gem "selenium-webdriver"

  # Linting
  gem "rubocop", "0.50.0"
  gem "rubocop-github"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
end

group :development, :test do
  gem "dotenv"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
