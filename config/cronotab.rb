# perform XML Download and parsing every day

Crono.perform(ExchangeRate).every 1.day, at: {hour: 12, min: 00}
