# See README for additional information.
# Written by: Russ Frisch
# http://github.com/russfrisch/Rails-HTML5-Boilerplate-Template
# Inspired by: Logan Leger's Rails 3 JQuery Template
# https://github.com/lleger/Rails-3-jQuery

# Download JavaScripts
get "https://github.com/paulirish/html5-boilerplate/raw/master/js/libs/modernizr-1.7.min.js", "public/javascripts/modernizr.js"
get "https://github.com/paulirish/html5-boilerplate/raw/master/js/libs/dd_belatedpng.js", "public/javascripts/dd_belatedpng.js"
get "https://github.com/paulirish/html5-boilerplate/raw/master/js/plugins.js", "public/javascripts/plugins.js"

# Download Stylesheets
get "https://github.com/paulirish/html5-boilerplate/raw/master/css/style.css", "public/stylesheets/_reset.scss"
get "https://github.com/paulirish/html5-boilerplate/raw/master/css/handheld.css", "public/stylesheets/handheld/handheld.scss"
# Create application.css for application styles
inside('public/stylesheets') do
  FileUtils.touch 'application.scss'
end

# Download Site Root Assets
get "https://github.com/paulirish/html5-boilerplate/raw/master/apple-touch-icon.png", "public/apple-touch-icon.png"
get "https://github.com/paulirish/html5-boilerplate/raw/master/crossdomain.xml", "public/crossdomain.xml"
get "https://github.com/paulirish/html5-boilerplate/raw/master/humans.txt", "public/humans.txt"
get "https://github.com/paulirish/html5-boilerplate/blob/master/.htaccess", "public/.htaccess"

# Merge application.html.erb with HTML5 Boilerplate index template
inside('app/views/layouts') do
  FileUtils.rm_rf 'application.html.erb'
end
get "https://github.com/paulirish/html5-boilerplate/raw/master/index.html", "app/views/layouts/application.html.erb"
gsub_file 'app/views/layouts/application.html.erb', /<link rel="stylesheet" href="css\/style.css">/ do
  "<%= stylesheet_link_tag :all, :cache => true %>
  <%= stylesheet_link_tag \"handheld/handheld\", :media => \"handheld\" %>"
end
gsub_file 'app/views/layouts/application.html.erb', /<!-- Uncomment if you are specifically targeting less enabled mobile browsers/, '\1'
gsub_file 'app/views/layouts/application.html.erb', /<link rel="stylesheet" media="handheld" href="css\/handheld.css">  -->/, '\1'
gsub_file 'app/views/layouts/application.html.erb', /<script src="js\/libs\/modernizr-1.7.min.js"><\/script>/, '<%= javascript_include_tag "modernizr" %>'
gsub_file 'app/views/layouts/application.html.erb', /<meta charset="utf-8">/ do
  "<meta charset=\"utf-8\">
   <%= csrf_meta_tag %>"
end
gsub_file 'app/views/layouts/application.html.erb', /<div id="container">[\s\S]*<\/div>/, '<%= yield %>'
gsub_file 'app/views/layouts/application.html.erb', /<!-- Grab Google CDN's jQuery[\s\S]*end scripts-->/, '<%= javascript_include_tag :defaults, :cache => true %>'
gsub_file 'app/views/layouts/application.html.erb', /<script src="js\/libs\/dd_belatedpng.js"><\/script>/, '<%= javascript_include_tag "dd_belatedpng" %>'

# Remove jQuery Comments in application.rb
# gsub_file 'config/application.rb', /#\s*(JavaScript files you want as :defaults (application.js is always included).)/, '\1'
# gsub_file 'config/application.rb', /#\s*(config.action_view.javascript_expansions[:defaults] = %w(jquery rails))/, '\1'

# Add expansions to application.rb
application do
  "  # Added by the Rails HTML5 Boilerplate Template
    # https://github.com/russfrisch/Rails-HTML5-Boilerplate-Template, written by Russ Frisch
    config.action_view.javascript_expansions[:defaults] = %w(jquery plugins rails)    
  "
end