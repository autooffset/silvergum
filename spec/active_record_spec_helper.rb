require 'active_record'
require 'shoulda/matchers/active_record'
require 'shoulda/matchers/active_model'

ActiveRecord::Base.establish_connection(
  YAML.load(File.open('config/database.yml'))['test']
)

RSpec.configure do |config|
  config.include Shoulda::Matchers::ActiveRecord
  config.include Shoulda::Matchers::ActiveModel
end

$LOAD_PATH.unshift File.expand_path(
  File.join(File.dirname(__FILE__), '..', 'app', 'models')
)
