duration_in_days = (end_date, begin_date) -> (end_date.getGregorianDate() - begin_date.getGregorianDate()) / 1000 / 60 / 60 / 24

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
    @daysInYear = duration_in_days(@nextRoshHashana, @thisRoshHashana)
  getDaysInYear: -> @daysInYear
  getMonthsInYear: -> if @isLeapYear() then 13 else 12
  getThisRoshHashana: -> @thisRoshHashana
  getNextRoshHashana: -> @nextRoshHashana
  isLeapYear: -> @daysInYear in [383, 384, 385]
  getYearFromCreation: -> @yearFromCreation

(exports ? this).HebrewYear = HebrewYear
