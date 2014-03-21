require 'rspec/profiler'
require 'pry'

RSpec.configure do |c|
  RSpec::Profiler.profile!(c)
end
