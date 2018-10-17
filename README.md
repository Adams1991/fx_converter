# README

Hi Guys,

Thought I would just write a quick ReadMe to help with navigation.

At the moment there are two models. One that downloads the XML (XmlDownloader) and one that parses this and attempts to save t to the DB. At the moment the saving to the DB function is not functional so looking into what may be causing that to hang now.

If you want to check the status of the scheduled task I used a gem called Crono (which is Ruby based scheduler) and it has it's own UI.
Just run 'bundle exec crono RAILS_ENV=development' in the command line and then go to http://localhost:3000/crono/ to check everything is grand.


Version Stuff
* Ruby version - 2.3
* Rails versions - 5.1
