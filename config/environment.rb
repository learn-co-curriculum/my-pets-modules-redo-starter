require_relative '../lib/pet'
require_relative '../lib/concerns/persistable'
Dir[File.join(File.dirname(__FILE__), "../lib", "*.rb")].each {|f| require f}
