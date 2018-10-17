# perform XML Download and parsing every day
Crono.perform(XmlDownloader).every 1.day

Crono.perform(DailyEuroExRate).every 1.day, at: {hour: 8, min: 00}

#
