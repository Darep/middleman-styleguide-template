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
    unless request.has_key?(:styleguide)
      request[:styleguide] = Kss::Parser.new('source/stylesheets/external')
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
end
