# perform XML Download and parsing every day
Crono.perform(XmlDownloader).every 1.day

Crono.perform(DailyEuroExRate).every 5.minutes

#
