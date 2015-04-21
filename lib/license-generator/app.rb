require 'thor'

module LicenseGenerator
  class App < Thor
    include Thor::Actions
    attr_accessor :authors

    # Path to the templates
    def self.source_root
      File.expand_path('../../templates', File.dirname(__FILE__))
    end

    def self.summary_root
      File.expand_path('../../summaries', File.dirname(__FILE__))
    end

    desc "list", "List available license templates"
    def list
      templates.each do |template|
        say template
      end
    end

    desc "info", "Show license summary"
    def info(license = nil)
      summaries = {}
      Dir.glob("#{LicenseGenerator::App.summary_root}/**/*.info") do |f|
        summaries[File.basename(f, '.info')] = f
      end

      if license
        if summaries.key? (license)
          $stdout.puts IO.read(summaries[license])
        else
          say "No summary available for #{license}"
        end
      else
        say "Available license summaries:"
        say "----------------------------"
        summaries.each do |title, summary|
          say title
        end
        say
        say "Usage: licgen info [license]"
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
