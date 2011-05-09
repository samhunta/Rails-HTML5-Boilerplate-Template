# See README for additional information.
# Written by: Russ Frisch
# http://github.com/russfrisch/Rails-HTML5-Boilerplate-Template
# Inspired by: Logan Leger's Rails 3 JQuery Template
# https://github.com/lleger/Rails-3-jQuery

# Delete old prototype drivers
# Do this first so that you don't delete the new jQuery rails one below
inside('public/javascripts') do
  FileUtils.rm_rf %w(controls.js dragdrop.js effects.js prototype.js rails.js)
end

# Download latest jQuery drivers
get "https://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"

# Download HTML5 Boilerplate JavaScripts
get "https://github.com/paulirish/html5-boilerplate/raw/master/js/libs/modernizr-1.7.min.js", "public/javascripts/modernizr.js"
get "https://github.com/paulirish/html5-boilerplate/raw/master/js/libs/jquery-1.6.min.js", "public/javascripts/jquery.js"
get "https://github.com/paulirish/html5-boilerplate/raw/master/js/libs/respond.min.js", "public/javascripts/respond.js"
get "https://github.com/paulirish/html5-boilerplate/raw/master/js/plugins.js", "public/javascripts/plugins.js"

# Download HTML5 Boilerplate Stylesheet
get "https://github.com/paulirish/html5-boilerplate/raw/master/css/style.css", "public/stylesheets/style.css"

# Create application.css for application styles and add import statment for scaffold.css
inside('public/stylesheets') do
  FileUtils.touch 'application.css'
end
append_file 'public/stylesheets/application.css', '@import url("scaffold.css"); /* Remove is not using scaffolding */'

# Download HTML5 Boilerplate Site Root Assets
get "https://github.com/paulirish/html5-boilerplate/raw/master/apple-touch-icon-114x114-precomposed.png", "public/apple-touch-icon-114x114-precomposed.png"
get "https://github.com/paulirish/html5-boilerplate/raw/master/apple-touch-icon-57x57-precomposed.png", "public/apple-touch-icon-57x57-precomposed.png"
get "https://github.com/paulirish/html5-boilerplate/raw/master/apple-touch-icon-72x72-precomposed.png", "public/apple-touch-icon-72x72-precomposed.png"
get "https://github.com/paulirish/html5-boilerplate/raw/master/apple-touch-icon-precomposed.png", "public/apple-touch-icon-precomposed.png"
get "https://github.com/paulirish/html5-boilerplate/raw/master/apple-touch-icon.png", "public/apple-touch-icon.png"
get "https://github.com/paulirish/html5-boilerplate/raw/master/crossdomain.xml", "public/crossdomain.xml"
get "https://github.com/paulirish/html5-boilerplate/raw/master/humans.txt", "public/humans.txt"
get "https://github.com/paulirish/html5-boilerplate/raw/master/.htaccess", "public/.htaccess"

# Update application.html.erb with HTML5 Boilerplate index.html content
inside('app/views/layouts') do
  FileUtils.rm_rf 'application.html.erb'
end
get "https://github.com/paulirish/html5-boilerplate/raw/master/index.html", "app/views/layouts/application.html.erb"
gsub_file 'app/views/layouts/application.html.erb', /<link rel="stylesheet" href="css\/style.css">/ do
  "<%= stylesheet_link_tag \"style\", \"application\", :media => \"all\", :cache => \"styles\" %>"
end
gsub_file 'app/views/layouts/application.html.erb', /<script src="js\/libs\/modernizr-1.7.min.js"><\/script>/, '<%= javascript_include_tag "modernizr", "respond", :cache => "modernizer-respond" %>'
gsub_file 'app/views/layouts/application.html.erb', /<script src='js\/libs\/respond.min.js'><\/script>/, '\1'
gsub_file 'app/views/layouts/application.html.erb', /<meta charset="utf-8">/ do
  "<meta charset=\"utf-8\">
   <%= csrf_meta_tag %>"
end
gsub_file 'app/views/layouts/application.html.erb', /<div id="container">[\s\S]*<\/div>/, '<%= yield %>'
gsub_file 'app/views/layouts/application.html.erb', /<!-- Grab Google CDN's jQuery[\s\S]*end scripts-->/, '<%= javascript_include_tag :defaults, :cache => true %>'

# Remove jQuery Comments in application.rb
gsub_file 'config/application.rb', /#\s*(JavaScript files you want as :defaults (application.js is always included).)/, '\1'
gsub_file 'config/application.rb', /#\s*(config.action_view.javascript_expansions[:defaults] = %w(jquery rails))/, '\1'

# Add expansions to application.rb
application do
  "  # Added by the Rails HTML5 Boilerplate Template
    # https://github.com/russfrisch/Rails-HTML5-Boilerplate-Template, written by Russ Frisch
    config.action_view.javascript_expansions[:defaults] = %w(jquery rails plugins)
  "
end