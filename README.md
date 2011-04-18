About
=====
A Rails application template used to setup a new Rails app using Paul Irish's HTML5 Boilerplate (http://html5boilerplate.com/)<br>
This template was inspired by Logan Leger's Rails 3 JQuery Template (https://github.com/lleger/Rails-3-jQuery)

How to Use
=========
`rails new <appname> -m <path/to/html5boilerplate.rb>`

Can also be run directly from github:<br>
`rails new <appname> -m https://github.com/russfrisch/Rails-HTML5-Boilerplate-Template/raw/master/html5boilerplate.rb`

Process
=======
This template does the following:

1.  Removes default Prototype/Scriptaculous JavaScripts and Rails driver
2.  Downloads the latest JQuery Rails driver and places into the javascripts folder
3.  Downloads HTML5 Boilerplate assets: JavaScripts, Stylesheets, icons, .htaccess, etc.
4.  Replaces the <i>contents</i> of default application.html.erb layout with the contents of HTML5 boilerplate's index.html
5.  Modifies the updated application.html.erb to add back in the appropriate default Rails content 
6.  Updates javascript :defaults expansion to include jquery, plugins, and rails driver.

Push Requests
============
This is my first template so if there is anything that can be done better or you would like to see tweaked, please send me a push request.
