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
      templates.each do |template|
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
        templates.each do |template|
          say "  licgen #{template}\t# Generate #{template} license"
        end
      end
    end

    no_tasks do
      def templates
        @templates ||= Dir.glob("#{LicenseGenerator::App.source_root}/**/*.erb").map { |t| File.basename(t, '.erb') }
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
