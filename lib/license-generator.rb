# Bullshit fix for 1.8.7
begin
  require 'rubygems'
rescue LoadError
  # oh well!
end

require 'nice-sigint'

module LicenseGenerator
  autoload :App, "license-generator/app"
end
