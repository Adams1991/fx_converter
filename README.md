# README

Hi Guys,

Thought I would just write a quick ReadMe to help with navigation and explain some of my thinking.

The library is setup in Rails and uses Nokogiri for XML parsing. I set it up in Rails as I know that's FreeAgents framework and I also wanted to learn more about it.
The application/library consists of two models. One that downloads the XML (XmlDownloader) and another that parses this and saves to the DB (ExchangeRate).

The XML data looped through to extract the needed data and is saved into the a table with time, rate & currency columns. The exchangeRate model has a scheduled task (under the perform method) that saves the data at 12am every day to be used by the app. This seemed to sync up with the XML being updated but I couldn't confirm that.

If you want to check the status of the scheduled tasks I used a gem called Crono which is Ruby based scheduler meaning no compatibility issues hopefully (I caused myself an issue with cron) and it has it's own UI.

Just run 'bundle exec crono RAILS_ENV=development' in the command line and then go to http://localhost:3000/crono/ to check everything is grand.

How to use library:

The function na





Version Stuff
* Ruby version - 2.3
* Rails versions - 5.1
