require 'sass'

module Jekyll
  class SassConverter < Converter
    safe true
    priority :low

    def setup
      return if @setup
      require 'sass'
      @setup = true
    rescue LoadError
      STDERR.puts 'You are missing a library required for sass. Please run:'
      STDERR.puts '  $ [sudo] gem install sass'
      raise FatalException.new("Missing dependency: sass")
    end

    def matches(ext)
      ext =~ /sass|scss/i
    end

    def output_ext(ext)
      ".css"
    end

    def convert(content)
      setup
      begin
        engine = Sass::Engine.new(content, :syntax => syntax(content), :load_paths => ["./sass/"], :style => :compressed).render
      rescue StandardError => e
        puts "Sass Exception (#{e.sass_line}: #{e.message})"
      end
    end

    private
    def syntax(content)
      content.include?(';') ? :scss : :sass
    end
  end
end
