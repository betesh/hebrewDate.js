class HebrewDate
  constructor: (date) ->
    @gregorianDate = date
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
  monthAndRangeAre: (month, range) -> @staticHebrewMonth is HebrewMonth[month] && @dayOfMonth in range
  isShabbat: -> 6 == @gregorianDate.getDay()
  isPurim: -> @staticHebrewMonth in [HebrewMonth.ADAR, HebrewMonth.ADAR_SHENI] && 14 == @dayOfMonth
  isMoed: -> @monthAndRangeAre('NISAN', [17..20]) || @monthAndRangeAre('TISHRI', [17..21])
  occasions: -> result = []; (result.push(chag.replace(/^is/, '')) if chag.match(/^is/) && @[chag]()) for chag, val of @; result.sort()

(->
  @HELPERS = {
    incrementDate: (date, length) -> date.setDate(date.getDate() + length)
    durationInGregorianDays: (end_date, begin_date) -> (end_date - begin_date) / 1000 / 60 / 60 / 24
    durationInHebrewDays: (end_date, begin_date) -> @durationInGregorianDays(end_date.getGregorianDate(), begin_date.getGregorianDate())
  }
).call(HebrewDate)

(exports ? this).HebrewDate = HebrewDate
