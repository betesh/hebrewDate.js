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
  isRoshHodesh: -> (1 == @dayOfMonth && @staticHebrewMonth isnt HebrewMonth.TISHRI) || 30 == @dayOfMonth
  isBeginTalUmatar: -> @gregorianDate.getMonth() == 11 && @gregorianDate.getDate() == (parseInt((@gregorianDate.getFullYear())/ 100) - parseInt((@gregorianDate.getFullYear())/ 400) - 11 + parseInt((4 - (@gregorianDate.getFullYear() + 1) % 4) / 4))
  # TODO: Missing tests from here
  isMaharHodesh: -> 29 == @dayOfMonth && @isShabbat()
  inElul: -> @staticHebrewMonth is HebrewMonth.ELUL
  isShabbatMevarechim: -> @dayOfMonth in [23..29] && @isShabbat() && !@inElul()
  isHachrazatTaanit: -> @isShabbat() && (@monthAndRangeAre('TEVET', [4..9]) || @monthAndRangeAre('TAMUZ', [11..17]))
  isShabbatSheqalim: -> @isShabbat() && (@monthAndRangeAre((if @hebrewYear.isLeapYear() then 'ADAR_RISHON' else 'SHEBAT'), [25..30]) || @monthAndRangeAre(@adarOrAdar2(), [1]))
  isShabbatZachor: -> @isShabbat() && @monthAndRangeAre(@adarOrAdar2(), [8..13])
  isShabbatParah: -> @isShabbat() && @monthAndRangeAre(@adarOrAdar2(), [18..23])
  isShabbatHaHodesh: -> @isShabbat() && (@monthAndRangeAre(@adarOrAdar2(), [25..29]) || @monthAndRangeAre('NISAN', [1]))
  isShabbatHaGadol: -> @isShabbat() && @monthAndRangeAre('NISAN', [8..14])
  isTuBiShvat: -> @monthAndRangeAre('SHEBAT', [15])
  isPesachSheni: -> @monthAndRangeAre('IYAR', [14])
  isLagLaomer: -> @monthAndRangeAre('IYAR', [18])
  isTuBAb: -> @monthAndRangeAre('AB', [15])
  is17Tammuz: -> !@isShabbat() && @monthAndRangeAre('TAMUZ', if 0 == @gregorianDate.getDay() then [17..18] else [17])
  is9Ab: -> !@isShabbat() && @monthAndRangeAre('AB', if 0 == @gregorianDate.getDay() then [9..10] else [9])
  isFastOfGedaliah: -> !@isShabbat() && @monthAndRangeAre('TISHRI', if 0 == @gregorianDate.getDay() then [4] else [3])
  is10Tevet: -> @monthAndRangeAre('TEVET', [10])
  isTaanitEster: -> !@isShabbat() && @monthAndRangeAre(@adarOrAdar2(), if 4 == @gregorianDate.getDay() then [11,13] else [13])
  isEreb9Av: -> !@isErebShabbat() && @monthAndRangeAre('AB', if @isShabbat() then [8..9] else [8])
  isErebYomKippur: -> @monthAndRangeAre('TISHRI', [9])
  is1stDayOfYomTob: -> @monthAndRangeAre('NISAN', [15,21]) || @is1stDayOfShabuot() || @monthAndRangeAre('TISHRI', [1,15,22])
  is1stDayOfShabuot: -> @monthAndRangeAre('SIVAN', [6])
  is6thDayOfPesach: -> @monthAndRangeAre('NISAN', [20])
  is7thDayOfPesach: -> @monthAndRangeAre('NISAN', [21])
  isErubTabshilin: -> @isErebYomTob() && @gregorianDate.getDay() in [3,4]
  isTaanit: -> @is9Ab() || @is17Tammuz() || @isFastOfGedaliah() || @isTaanitEster() || @is10Tevet()
  isHataratNedarim: -> @monthAndRangeAre('AB', [19,29]) || @monthAndRangeAre('ELUL', [29]) || @monthAndRangeAre('TISHRI', [9])
  isErebPesach: -> @monthAndRangeAre('NISAN', [14])
  is1stDayOfPesach: -> @monthAndRangeAre('NISAN', [15])
  is2ndDayOfPesach: -> @monthAndRangeAre('NISAN', [16])
  is8thDayOfPesach: -> @monthAndRangeAre('NISAN', [22])
  isErebShabuot: -> @monthAndRangeAre('SIVAN', [5])
  isErebRoshHashana: -> @monthAndRangeAre('ELUL', [29])
  isErebSukkot: -> @monthAndRangeAre('TISHRI', [14])
  isHoshanaRaba: -> @monthAndRangeAre('TISHRI', [21])
  isSheminiAseret: -> @monthAndRangeAre('TISHRI', [22..23])
  isBirkatHaIlanot: -> !@isShabbat() && @monthAndRangeAre('NISAN', if 0 == @gregorianDate.getDay() then [1..2] else [1])
  isTefilatHaShelah: -> @monthAndRangeAre('IYAR', [29])
  is2ndDayOfYomTob: -> @is2ndDayOfPesach() || @is8thDayOfPesach() || @monthAndRangeAre('SIVAN', [7]) || @monthAndRangeAre('TISHRI', [2,16,23])
  isErebHoshanaRaba: -> @monthAndRangeAre('TISHRI', [20])
  # Till here
  weekOfYear: -> parseInt((@dayOfYear + 11 - @gregorianDate.getDay()) / 7) + (if 6 == @hebrewYear.getThisRoshHashana().getGregorianDate().getDay() then 1 else 0)
  occasions: -> result = []; (result.push(chag.replace(/^is/, '')) if chag.match(/^is/) && @[chag]() && !(@[chag] in (@["is#{alias}"] for alias in result))) for chag, val of @; result.sort()
  sedra: -> @hebrewYear.sedrot().sedra(@)
  omer: -> @_omer ?= (switch @staticHebrewMonth
    when HebrewMonth.NISAN then (
      if (@dayOfMonth > 15) then { today: @dayOfMonth - 15, tonight: @dayOfMonth - 14 }
      else if 15 == @dayOfMonth then { tonight: @dayOfMonth - 14 }
      else null)
    when HebrewMonth.IYAR then { today: 15 + @dayOfMonth, tonight: 16 + @dayOfMonth }
    when HebrewMonth.SIVAN then (
      if (@dayOfMonth < 5) then { today: @dayOfMonth + 44, tonight: @dayOfMonth + 45 }
      else if 5 == @dayOfMonth then { today: @dayOfMonth + 44 }
      else null)
    else null)

(->
  @HELPERS = {
    incrementDate: (date, length) -> date.setDate(date.getDate() + length)
    durationInGregorianDays: (end_date, begin_date) -> (end_date - begin_date) / 1000 / 60 / 60 / 24
    durationInHebrewDays: (end_date, begin_date) -> @durationInGregorianDays(end_date.getGregorianDate(), begin_date.getGregorianDate())
  }
).call(HebrewDate)

HebrewDate.prototype.isRoshHaShana = HebrewDate.prototype.isRoshHaShanah = HebrewDate.prototype.isRoshHashanah = HebrewDate.prototype.isRoshHashana
HebrewDate.prototype.isYomTov = HebrewDate.prototype.isYomTob
HebrewDate.prototype.isRoshChodesh = HebrewDate.prototype.isRoshHodesh
HebrewDate.prototype.isLagBaOmer = HebrewDate.prototype.isLagLaOmer = HebrewDate.prototype.isLagBaomer = HebrewDate.prototype.isLagLaomer
HebrewDate.prototype.isHanuka = HebrewDate.prototype.isHanukka = HebrewDate.prototype.isHanukah = HebrewDate.prototype.isHanukkah = HebrewDate.prototype.isChanuka = HebrewDate.prototype.isChanukka = HebrewDate.prototype.isChanukah = HebrewDate.prototype.isChanukkah
HebrewDate.prototype.is17Tamuz = HebrewDate.prototype.is17Tammuz
HebrewDate.prototype.is9Av = HebrewDate.prototype.is9Ab
HebrewDate.prototype.isTzomGedalia = HebrewDate.prototype.isTzomGedaliah = HebrewDate.prototype.isFastOfGedalia = HebrewDate.prototype.isFastOfGedaliah
HebrewDate.prototype.isTaanitEsther = HebrewDate.prototype.isTaanitEster
HebrewDate.prototype.isEreb9Ab = HebrewDate.prototype.isEreb9Av

(exports ? this).HebrewDate = HebrewDate
