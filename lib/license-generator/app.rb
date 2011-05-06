require 'thor'

module LicenseGenerator
  class App < Thor
    include Thor::Actions
    
    # Path to the templates
    def self.source_root
      File.expand_path('../../templates', File.dirname(__FILE__))
    end
    
    desc "bsd", "Generate a BSD LICENSE"
    method_options :name => :required, :organization => :required
    def bsd
      template "bsd.erb", "LICENSE"
    end
  end
end
