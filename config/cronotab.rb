# perform XML Download and parsing every day

Crono.perform(ExchangeRate).every 1.day, at: {hour: 11, min: 00}
