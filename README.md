== README
Project name: enterprise

enterprise. is a contents management system.
The system is created for providing the end users to experience of interactive web CMS (contents management system).

There are two major functions.
User can create / edit / remove  HTML file document from plain text with markdown language.
The end users experience the interactive CMS to get a desired information instantly.

The demo version is found in URL: http://enterprisedot.herokuapp.com/

* Requirements Ruby and Rails
  The application is created with Ruby2.0 / Rails4.1.1

* Configuration
  Following GEMs are required.
      For markdown:
        gem 'markdown-rails’
        gem ‘redcarpet'

      For pagination
        gem ‘kaminari'

      For File Uploads / storage
        gem ‘carrierwave’
        gem ‘mini_magick’
        gem 'cloudinary'

      For CSS
        gem 'bootstrap-sass'

* Database creation
  Postgres version 9.3


* GEM's further details / references
  Redcarpet https://github.com/vmg/redcarpet
  Kaminari https://github.com/amatsuda/kaminari
  carrier wave https://github.com/carrierwaveuploader/carrierwave

* Services (job queues, cache servers, search engines, etc.)
  - Search the contents from the serach
  - Forum with comments/ search function for titles

* How to use edit section / Markdown
  The system uses markdown language (Redcarpet) to create HTML file.
  For details, please check https://github.com/vmg/redcarpet

* About us / team
  Genral Assembly Sydney WDI-5 students group.

*Copyright (c) 2014,
  Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.