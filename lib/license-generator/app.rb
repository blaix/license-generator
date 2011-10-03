require 'thor'

module LicenseGenerator
  class App < Thor
    include Thor::Actions
    
    # Path to the templates
    def self.source_root
      File.expand_path('../../templates', File.dirname(__FILE__))
    end
    
    desc "list", "List available license templates"
    def list
      Dir.foreach(self.class.source_root) do |template|
        say template unless %w(. ..).include?(template)
      end
    end

    def method_missing(meth, *args)
      template "#{meth}.erb", "LICENSE"
    end
    
    # Override Thor#help so it can give information about any class and any method.
    def help(task = nil)
      super
      say "Templates:"
      Dir.foreach(self.class.source_root) do |template|
        unless %w(. ..).include?(template)
          template = template.split('.').first
          say "  lickjen #{template}\t# Generate a #{template} template"
        end
      end
    end
    
    private
    def option(name)
      @template_options ||= {}
      @template_options[name] ||= ask("#{name.capitalize}:")
      @template_options[name]
    end
  end
end
