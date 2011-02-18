Browscap
========

Using the excellent http://github.com/lfittl/browscap parser as a rail plugin

run rake browscap:update to get the new browscap.ini from http://browsers.garykeith.com

Known Issues
========

Ruby 1.9:

The file is ISO-8859-1

The hex escape char \xdf in

Line 3553

    [Der gro\xdfe BilderSauger*]
    Parent=Image Crawlers
    Browser=Gallery Grabber

makes the current version of browscap choke. I have monkey patched browscap so you should be fine.

Also Line 5228

[www.substancia.com AutoHTTPAgent (ver *)]
Parent=Version Checkers
Browser=Substância

the 'â' make inifile < 0.4.0 choke.

The lib requires inifile >= 0.4.0 so this should be fine.

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

Copyright (c) 2010 [Gilles Devaux], released under the MIT license
