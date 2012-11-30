# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}


RSpec.configure do |config|

  Capybara.javascript_driver = :webkit

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.include LoginMacros

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures



  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.

  config.use_transactional_fixtures = false


  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
end

OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:facebook, { :provider    => "facebook",
                                      :uid         => "1234",
                                      :info        => { :name  => "Jonathan Pepin",
                                                        :email => "jypepin@facebook.com",
                                                        :image => 'http://graph.facebook.com/1234567/picture?type=square',
                                                        :urls => { :Facebook => 'http://www.facebook.com/jbloggs' }
                                                      },
                                      :credentials => { :token      => "lk2j3lkjasldkjflk3ljsdf",
                                                        :expires_at =>  1321747205,
                                                        :expires    => true
                                                      },
                                      :extra       => { :raw_info   => {:gender => "male"}}

                                    })

