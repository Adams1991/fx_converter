# README

Hi Folks,

Thought I would just write a quick ReadMe to help with navigation and explain some of my thinking.

The library is setup in Rails and uses Nokogiri for XML parsing. The application/library consists of two models one that downloads the XML (XmlDownloader) and one that deals with that data (ExchangeRate). I wanted to separate these functions so I could test each individually.

If you want to check the status of the scheduled tasks I used a gem called Crono which is Ruby based scheduler and it has it's own UI. Just run 'bundle exec crono RAILS_ENV=development' in the command line and then go to http://localhost:3000/crono/ after running the server to check everything is grand.

How to use library:

If you instantiate an ExchangeRate object you can call exchangeRate.at(Date.today, base_currency, counter_currency) which will return you the conversion rate on that day. You can also call exchangeRate.convert_currency_using_specific_day_rates(amount, (Date.today, base_currency, counter_currency) which will return you the converted amount.

I envisioned both of these methods being used to provide output for a front end UI like the wireframe provided.

I have also input a method for changing the settings for the URL and XML attributes. This was to hopefully make the library more flexible for the different XML source in production.

I really hope this library is up to scratch and would love feedback on what I could have improved on.

Version Stuff
* Ruby version - 2.3
* Rails versions - 5.1
