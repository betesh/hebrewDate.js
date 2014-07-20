class HebrewDate
  constructor: (date) ->
    @hebrewYear = new HebrewYear(date)
    @dayOfYear = parseInt(HebrewDate.HELPERS.durationInGregorianDays(date, @hebrewYear.getThisRoshHashana().getGregorianDate()) + 1)
    dayOfMonth = @dayOfYear
    months = HebrewMonth.MONTHS.ofYear(@hebrewYear)
    month = 0
    while dayOfMonth > (length = months[month].length(@hebrewYear))
      dayOfMonth -= length
      ++month
    @hebrewMonth = new HebrewMonth(@hebrewYear, month)
    @staticHebrewMonth = months[month]
    @dayOfMonth = dayOfMonth
  getHebrewYear: -> @hebrewYear
  getHebrewMonth: -> @hebrewMonth
  getYearFromCreation: -> @hebrewYear.getYearFromCreation()
  getDayOfYear: -> @dayOfYear
  getDayOfMonth: -> @dayOfMonth
  isPurim: -> @staticHebrewMonth in [HebrewMonth.ADAR, HebrewMonth.ADAR_SHENI] && 14 == @dayOfMonth

(->
  @HELPERS = {
    incrementDate: (date, length) -> date.setDate(date.getDate() + length)
    durationInGregorianDays: (end_date, begin_date) -> (end_date - begin_date) / 1000 / 60 / 60 / 24
    durationInHebrewDays: (end_date, begin_date) -> @durationInGregorianDays(end_date.getGregorianDate(), begin_date.getGregorianDate())
  }
).call(HebrewDate)

(exports ? this).HebrewDate = HebrewDate
