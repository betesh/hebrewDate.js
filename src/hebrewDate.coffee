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
  isErebShabbat: -> 5 == @gregorianDate.getDay()
  isShabbat: -> 6 == @gregorianDate.getDay()
  adarOrAdar2: -> if @hebrewYear.isLeapYear() then 'ADAR_SHENI' else 'ADAR'
  isPurim: -> @monthAndRangeAre(@adarOrAdar2(), [14])
  isShushanPurim: -> @monthAndRangeAre(@adarOrAdar2(), [15])
  isPurimKatan: -> @monthAndRangeAre('ADAR_RISHON', [14])
  isShushanPurimKatan: -> @monthAndRangeAre('ADAR_RISHON', [15])
  isMoed: -> @monthAndRangeAre('NISAN', [17..20]) || @monthAndRangeAre('TISHRI', [17..21])
  isPesach: -> @monthAndRangeAre('NISAN', [15..22])
  isShabuot: -> @monthAndRangeAre('SIVAN', [6..7])
  isRoshHashana: -> @monthAndRangeAre('TISHRI', [1..2])
  is10DaysOfTeshuba: -> @monthAndRangeAre('TISHRI', [1..10])
  isYomKippur: -> @monthAndRangeAre('TISHRI', [10])
  isSukkot: -> @monthAndRangeAre('TISHRI', [15..23])
  isRegel: -> @isPesach() || @isShabuot() || @isSukkot()
  isErebYomTob: -> @monthAndRangeAre('NISAN', [14,20]) || @monthAndRangeAre('SIVAN', [5]) || @monthAndRangeAre('ELUL', [29]) || @monthAndRangeAre('TISHRI', [14,21])
  isYomTob: -> @monthAndRangeAre('NISAN', [15,16,21,22]) || @isShabuot() || @monthAndRangeAre('TISHRI', [1,2,15,16,22,23])
  isChanukkah: -> @monthAndRangeAre('KISLEV', [25..30]) || @monthAndRangeAre('TEVET', [1..(if @hebrewYear.getDaysInYear() % 10 > 3 then 2 else 3)])
  isRoshHodesh: -> @dayOfMonth in [1,30] && @staticHebrewMonth isnt HebrewMonth.TISHRI
  occasions: -> result = []; (result.push(chag.replace(/^is/, '')) if chag.match(/^is/) && @[chag]()) for chag, val of @; result.sort()

(->
  @HELPERS = {
    incrementDate: (date, length) -> date.setDate(date.getDate() + length)
    durationInGregorianDays: (end_date, begin_date) -> (end_date - begin_date) / 1000 / 60 / 60 / 24
    durationInHebrewDays: (end_date, begin_date) -> @durationInGregorianDays(end_date.getGregorianDate(), begin_date.getGregorianDate())
  }
).call(HebrewDate)

(exports ? this).HebrewDate = HebrewDate
