class HebrewMonth
  constructor: (hebrewYear, hebrewMonthIndex) ->
    @hebrewYear = hebrewYear
    @monthsOfYear = HebrewMonth.MONTHS.ofYear(hebrewYear)
    @hebrewMonth = @monthsOfYear[hebrewMonthIndex]
    @length = @hebrewMonth.length(hebrewYear)
    @gregorianDateOfThisRoshHodesh = new Date(hebrewYear.getThisRoshHashana().getGregorianDate())
    i = 0
    while i < hebrewMonthIndex
      HebrewDate.HELPERS.incrementDate(@gregorianDateOfThisRoshHodesh, @monthsOfYear[i].length(hebrewYear))
      ++i
    @gregorianDateOfNextRoshHodesh = new Date(@gregorianDateOfThisRoshHodesh)
    HebrewDate.HELPERS.incrementDate(@gregorianDateOfNextRoshHodesh, @length)
  getLength: -> @length
  getName: -> @hebrewMonth.name
  getThisRoshHodesh: -> @gregorianDateOfThisRoshHodesh
  getNextRoshHodesh: -> @gregorianDateOfNextRoshHodesh

(->
  @TISHRI = @TISHREI = { name: "תִּשְׁרִי", length: (year) -> 30 }
  @HESHVAN = @CHESHVAN = { name: "מַרְחֶשְׁוָן", length: (year) -> if year.getDaysInYear() % 10 > 4 then 30 else 29 }
  @KISLEV = { name: "כִּסְלֵו", length: (year) -> if year.getDaysInYear() % 10 > 3 then 30 else 29 }
  @TEBET = @TEVET = { name: "טֵבֵת", length: (year) -> 29}
  @SHEBAT = @SHEVAT = { name: "שְׁבָט", length: (year) -> 30 }
  @ADAR = { name: "אֲדָר", length: (year) -> if year.isLeapYear() then null else 29 }
  @ADAR_RISHON = { name: "אֲדָר רִאשׁוֹן", length: (year) -> if year.isLeapYear() then 30 else null }
  @ADAR_SHENI = { name: "אֲדָר שֵׁנִי", length: (year) -> if year.isLeapYear() then 29 else null }
  @NISAN = @NISSAN = { name: "נִיסָן", length: (year) -> 30 }
  @IYAR = { name: "אִיָּר", length: (year) -> 29 }
  @SIVAN = { name: "סִיוָן", length: (year) -> 30 }
  @TAMUZ = @TAMMUZ = { name: "תַּמּוּז", length: (year) -> 29 }
  @AB = @AV = { name: "אָב", length: (year) -> 30 }
  @ELUL = { name: "אֱלוּל", length: (year) -> 29 }
  @MONTHS = { PESHUTA: [@TISHRI, @HESHVAN, @KISLEV, @TEVET, @SHEVAT, @ADAR, @NISAN, @IYAR, @SIVAN, @TAMUZ, @AB, @ELUL] }
  @MONTHS.MEUBERET = @MONTHS.PESHUTA.slice(0)
  @MONTHS.MEUBERET.splice(@MONTHS.PESHUTA.indexOf(@ADAR), 1, @ADAR_RISHON, @ADAR_SHENI)
  @MONTHS.ofYear = (hebrewYear) -> if hebrewYear.isLeapYear() then @MEUBERET else @PESHUTA
  @NAMES = (month.name for month in @MONTHS.PESHUTA)
).call(HebrewMonth)

(exports ? this).HebrewMonth = HebrewMonth
