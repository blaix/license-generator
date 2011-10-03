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
      for_each_template do |template|
        say template
      end
    end

    def method_missing(meth, *args)
      template "#{meth}.erb", "LICENSE"
    end
    
    # Override Thor#help to include templates.
    def help(task = nil)
      super
      unless task
        say "Templates:"
        for_each_template do |template|
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
    
    def for_each_template
      Dir.foreach(self.class.source_root) do |template|
        unless %w(. ..).include?(template)
          template = template.split('.').first
          yield(template)
        end
      end
    end
  end
end
