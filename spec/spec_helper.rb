ENV["RAILS_ENV"] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.fixture_path = ::Rails.root.join 'spec', 'fixtures'

  config.use_transactional_fixtures = true
  config.order = 'random'
  config.infer_spec_type_from_file_location!

  config.include SpecSupport::Controllers::RespondWith, type: :controller
end
