class HebrewYear
  constructor: (gregorianDate) ->
    gregorianYear = gregorianDate.getFullYear()
    hebrewYear = gregorianYear + 3761
    @thisRoshHashana = new RoshHashana(hebrewYear)
    if @thisRoshHashana.getGregorianDate() > gregorianDate
      @nextRoshHashana = @thisRoshHashana
      @thisRoshHashana = new RoshHashana(hebrewYear - 1)
    else
      @nextRoshHashana = new RoshHashana(hebrewYear + 1)
    @daysInYear = (@nextRoshHashana.getGregorianDate() - @thisRoshHashana.getGregorianDate()) / 1000 / 60 / 60 / 24
  getDaysInYear: -> @daysInYear
  getMonthsInYear: -> if @isLeapYear() then 13 else 12
  getThisRoshHashana: -> @thisRoshHashana
  getNextRoshHashana: -> @nextRoshHashana
  isLeapYear: -> @daysInYear in [383, 384, 385]
  getYearFromCreation: -> @thisRoshHashana.getHebrewYear()

(exports ? this).HebrewYear = HebrewYear
