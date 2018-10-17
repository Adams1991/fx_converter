# README

Hi Guys,

Thought I would just write a quick ReadMe to help with navigation and explain some of my thinking.

At the moment there are two models. One that downloads the XML (XmlDownloader) and one that parses this and saves to the DB (DailyEuroExRate). XML data is saved into the one table with time, rate & currency columns. The DailyEuroExRate model has a scheduled task (under the perform method) that saves the data at 7am every day to be used by the app.

TODO : Create wireframe front end

If you want to check the status of the scheduled tasks I used a gem called Crono which is Ruby based scheduler meaning now compatibility issues hopefully and it has it's own UI.
Just run 'bundle exec crono RAILS_ENV=development' in the command line and then go to http://localhost:3000/crono/ to check everything is grand.

Version Stuff
* Ruby version - 2.3
* Rails versions - 5.1
