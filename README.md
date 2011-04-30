About
======
A Rails application template used to setup a new Rails app using Paul Irish's HTML5 Boilerplate (http://html5boilerplate.com/)<br>
This template was inspired by Logan Leger's Rails 3 JQuery Template (https://github.com/lleger/Rails-3-jQuery)

How to Use
===========
Rails 3:<br> 
`rails new <appname> -m <path/to/rails3.rb>`<br>

Can also be run directly from github:<br>
Rails 3:<br>
`rails new <appname> -m https://github.com/russfrisch/Rails-HTML5-Boilerplate-Template/raw/master/rails3.rb`<br>

Rails 3 Version
================
This template does the following:

1.  Removes default Prototype/Scriptaculous JavaScripts and Rails driver
2.  Downloads the latest JQuery Rails driver and places into the javascripts folder
3.  Downloads HTML5 Boilerplate assets: JavaScripts, Stylesheets, icons, .htaccess, etc.
4.  Creates an empty application.css and then adds to it an @import to import the scaffold.css.
5.  Replaces the <i>contents</i> of default application.html.erb layout with the contents of HTML5 boilerplate's index.html
6.  Modifies the updated application.html.erb to add back in the appropriate default Rails content 
7.  Updates javascript :defaults expansion to include jquery, plugins, and rails driver.

Rails 3.1 Version
================
Comming soon with optional support to revert out CoffeeScript and SCSS changes if you so desire.

Push Requests
==============
This is my first template so if there is anything that can be done better or you would like to see tweaked, please send me a push request.
