class HebrewYear
  constructor: (gregorianDate) ->
    gregorianYear = gregorianDate.getFullYear()
    @yearFromCreation = gregorianYear + 3761
    @thisRoshHashana = new RoshHashana(@yearFromCreation)
    if @thisRoshHashana.getGregorianDate() > gregorianDate
      @nextRoshHashana = @thisRoshHashana
      @yearFromCreation -= 1
      @thisRoshHashana = new RoshHashana(@yearFromCreation)
    else
      @nextRoshHashana = new RoshHashana(@yearFromCreation + 1)
    @daysInYear = HebrewDate.HELPERS.durationInHebrewDays(@nextRoshHashana, @thisRoshHashana)
  getDaysInYear: -> @daysInYear
  getMonthsInYear: -> if @isLeapYear() then 13 else 12
  getThisRoshHashana: -> @thisRoshHashana
  getNextRoshHashana: -> @nextRoshHashana
  isLeapYear: -> @daysInYear in [383, 384, 385]
  getYearFromCreation: -> @yearFromCreation
  sedrot: -> new Sedra(@)

(exports ? this).HebrewYear = HebrewYear
