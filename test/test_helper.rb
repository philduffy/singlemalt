ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/matchers'
require 'minitest/rails'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  class MiniTest::Rails::ActionController::TestCase
    include Devise::TestHelpers
  end

  class MiniTest::Rails::ActiveSupport::TestCase
    include FactoryGirl::Syntax::Methods
  end

  def assert_flash(flash_type)
    assert flash[flash_type].present?, "sets flash[:#{flash_type}]"
  end
end
