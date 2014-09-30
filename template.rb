#encoding: utf-8
#read more here: http://guides.rubyonrails.org/rails_application_templates.html
#
# an rails template for jruby with sqlite and full testing equipment.
#

# gems
gem 'activerecord-jdbcsqlite3-adapter'
gem 'sass-rails', '~> 4.0.3'

gem_group :development, :test do
  gem 'rspec-rails', '~> 2.14.1'
  gem 'fabrication', '~> 2.11.2'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'forgery'
end

initializer 'disable_jce_restrictions.rb', <<-CODE
  java.lang.Class.for_name('javax.crypto.JceSecurity').get_declared_field('isRestricted').tap{|f| f.accessible = true; f.set nil, false}
end
