require 'thor'

module LicenseGenerator
  class App < Thor
    include Thor::Actions
    
    # Path to the templates
    def self.source_root
      File.expand_path('../../templates', File.dirname(__FILE__))
    end
    
    desc "list templates", "List available license templates"
    def list
      Dir.foreach(self.class.source_root) do |template|
        say template unless %w(. ..).include?(template)
      end
    end

    def method_missing(meth, *args)
      template "#{meth}.erb", "LICENSE"
    end
    
    private
    def option(name)
      @template_options ||= {}
      @template_options[name] ||= ask("#{name.capitalize}:")
      @template_options[name]
    end
  end
end
