###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  # activate :livereload
  activate :sprockets
  # activate :syntax, :line_numbers => true
  activate :directory_indexes
  activate :i18n, :langs => [:en]
  activate :search_engine_sitemap
  activate :disqus do |d|
    # using a special shortname
    d.shortname = "thegoldbug"
    # or setting to `nil` will stop Disqus loading
    # d.shortname = nil
  end
  activate :deploy do |deploy|
    deploy.deploy_method = :git
    # Optional Settings
    # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
    # deploy.branch   = 'custom-branch' # default: gh-pages
    # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
    # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
  end  
end

set :encoding, "utf-8"
set :markdown_engine, :redcarpet
set :markdown, autolink:           true,
               fenced_code_blocks: true,
               no_intra_emphasis:  true,
               strikethrough:      true,
               tables:             true,
               hard_wrap:          true,
               with_toc_data:      true
set :url_root, 'http://rmoliva,github.io'

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def date_format date
    date.strftime('%Y %b %e')
  end

  def tag_label tag_name
    [
      "<a href='#{tag_path(tag_name)}' class='ui button basic blue mini'>",
      "<i class='tag icon'></i>",
      tag_name,
      "</a>"
    ].join
  end
end

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.permalink = "posts/{year}-{month}-{day}-{title}.html"
  blog.layout = "blog"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
  # #
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
  activate :disqus do |d|
    # using a different shortname for production builds
    d.shortname = "thegoldbug"
  end
end
