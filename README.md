About
=====
Rails template to setup a new Rails app using Paul Irish's HTML5 Boilerplate (http://html5boilerplate.com/)<br>
This template was inspired by Logan Leger's Rails 3 JQuery Template (https://github.com/lleger/Rails-3-jQuery)

How to Use - New Project
========================
`rails new <appname> -m <path/to/html5boilerplate.rb>`

Can also be run directly from github:<br>
`rails new <appname> -m https://github.com/russfrisch/Rails-HTML5-Boilerplate-Template/raw/master/html5boilerplate.rb`

Process
=======
This template does the following:

1.  Remove default prototype/scriptaculous javascripts and rails driver
2.  Download latest jQuery Rails driver and place into javascripts folder
3.  Download HTML5 Boilerplate dependencies: javascripts, stylesheets, icons, .htaccess, etc.
4.  Replace contents of default application.html.erb layout with HTML5 boilerplate index.html
5.  Modify application.html.erb to add back in appropriate Rails content 
4.  Update javascript :defaults expansion to include jquery, plugins, and rails driver.

Push Requests
=============
This is my first template so if there is anything that can be done better or would like to see tweaks, please sent me a push request.
