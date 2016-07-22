$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rspec/its'
require 'bloqus'
require 'bloqus_spec_helper'

RSpec.configure do |c|
  c.include BloqusSpecHelper
end
