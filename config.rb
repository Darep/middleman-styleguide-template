set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Clean URLs
activate :directory_indexes

# Middleman navigation
activate :navigation

# KSS helpers
set :markdown_engine, :redcarpet
activate :kss, :kss_dir => 'stylesheets/external'

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
