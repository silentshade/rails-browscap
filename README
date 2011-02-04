Browscap
========

Using the excellent http://github.com/lfittl/browscap parser as a rail plugin

run rake browscap:update to get the new browscap.ini from http://browsers.garykeith.com

Known Issues
========

Ruby 1.9:

The file is LATIN1 and contains UTF-8 encoded chars

Line 3553

    [Der gro\xdfe BilderSauger*]
    Parent=Image Crawlers
    Browser=Gallery Grabber

This makes inifile fails. Delete this line or encode it properly.

    [Der große BilderSauger*]
    Parent=Image Crawlers
    Browser=Gallery Grabber

Example
=======

initializer/application.rb

    BROWSCAP = Browscap.new 'config/browscap.ini'

application_controller.rb

    def current_browser
      @current_browser ||= BROWSCAP.query(request.user_agent)
    end

TODO
=======

* Initialize and define current_browser in the plugin itself
* Fix task (does not show up in rake -T)
* Convert file to proper UTF8

Copyright (c) 2010 [Gilles Devaux], released under the MIT license
