require 'thor'

module LicenseGenerator
  class App < Thor
    include Thor::Actions
    attr_accessor :authors

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
      self.authors = args.empty? ? option(:authors) : args.join(', ')
      template "#{meth}.erb", "LICENSE"
    end

    def help(task = nil)
      unless task
        say "Generate an open source license for your project."
        say ""
        say "Usage:"
        say "  licgen <license> [<author1>, [<author2> ...]]"
        say ""

        say "Other "
      end
      super
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
