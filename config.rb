set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :directory_indexes

# Middleman navigation
activate :navigation

# Markdown in KSS
require 'redcarpet'
helpers do
  def markdown(input)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render(input)
  end
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  compass_config do |config|
    config.output_style = :compact
    config.line_comments = false
  end

  # Minify Javascript on build
  activate :minify_javascript

  # Uniquely-named assets
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true
end
