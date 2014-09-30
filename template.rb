#encoding: utf-8
#read more here: http://guides.rubyonrails.org/rails_application_templates.html
#
# an rails template for jruby with sqlite and full testing equipment.
#

# gems

gem_group :development, :test do
  gem 'rspec-rails', '~> 2.14.1'
  gem 'fabrication', '~> 2.11.2'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'forgery'
end

initializer 'disable_jce_restrictions.rb', <<-CODE
  java.lang.Class.for_name('javax.crypto.JceSecurity').get_declared_field('isRestricted').tap{|f| f.accessible = true; f.set nil, false}
CODE

inject_into_file 'config/application.rb', :after => "class Application < Rails::Application" 
  do 
    <<-eos

      config.i18n.default_locale = :de
      
      config.generators do |g|
        g.test_framework      :rspec, fixture: true
        g.fixture_replacement :fabrication
      end

    eos 
end

config.generators do |g|
  g.test_framework      :rspec, fixture: true
  g.fixture_replacement :fabrication
end

generate('rspec:install')
