begin
  require 'redcarpet'
rescue LoadError
end

module Middleman
  module KSS
    class << self

      def options
        @@options
      end

      def registered(app, options_hash={})
        @@options = options_hash
        yield @@options if block_given?

        app.send :include, Helpers
      end
      alias :included :registered
    end

    module Helpers
      # Renders a styleblock with or without styleguide information.
      #
      # @param [String] tile
      #   Name of the style tile file to render.
      # @param [Hash] options
      #   Options for rendering.
      # @option options [String] :section
      #   KSS section number (e.g. "1.1") for fetching the styleguide information.
      #
      # @return [String] Generated HTML.
      #
      def styleblock(tile, options = {})
        extension_options = ::Middleman::KSS.options

        # Parse the KSS style guide once per request (because it might change a lot, yo)
        unless request.has_key?(:styleguide)
          request[:styleguide] = Kss::Parser.new(extension_options[:kss_dir])
        end

        @styleguide = request[:styleguide]

        tile_file = "_#{tile}.html.erb"
        # TODO: can we get this path dynamically somehow? lose the magic strings?
        tile_path = File.join(self.source_dir, "styleblocks", tile_file)
        @block_html = File.read(tile_path)

        if options.has_key?(:section)
          @section = @styleguide.section(options[:section])
          # TODO: can we get this path dynamically? lose the magic strings?
          styleguide_block_path = File.join(self.source_dir, "partials", "_styleguide_block.html.erb")
          render_individual_file(styleguide_block_path)
        else
          return @block_html.gsub('$modifier_class', '').gsub(' class=""', '')
          #render_individual_file(@block_html)
        end
      end

      # Simple HTML escape helper
      def h(text)
        Rack::Utils.escape_html(text)
      end

      # Markdown in KSS
      def markdown(input)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
        markdown.render(input)
      end

    end
  end
end

::Middleman::Extensions.register(:kss) do
  ::Middleman::KSS
end
