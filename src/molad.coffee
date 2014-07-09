###
  Molad takes a number of halakim as its sole constructor argument.
  Halakim of 0 indicates 6PM Friday night.
  Note that getDay() returns an integer using the same convention as Javascript's Date class--i.e. 0 == Sunday, 1 == Monday, etc.
  However, the constructor argument counts from Friday night because that is the convention in halachic literature.
###

positive_modulus = (a,b) -> ((a % b) + b) % b
leapMonthsElapsedInCurrent19YearCycle = (n) -> Math.floor(3*n/8) - Math.floor(n/16) + Math.floor(n/17)
leapMonthsInHistory = (n) -> Math.floor((n - 1)/ 19) * 7 + leapMonthsElapsedInCurrent19YearCycle((n - 1) % 19)

class Molad
  constructor: (totalHalakim) ->
    @totalHalakim = positive_modulus(totalHalakim, Molad.HALAKIM_PER_WEEK)
    @halakim = @totalHalakim % Molad.HALAKIM_PER_HOUR
    @hours = Math.floor(@totalHalakim / Molad.HALAKIM_PER_HOUR) % 24
    @day = positive_modulus(Math.floor(totalHalakim / Molad.HALAKIM_PER_DAY) + 6, 7)
    @halakimIntoDay = @totalHalakim % Molad.HALAKIM_PER_DAY
  getHalakim: -> @halakim
  getHours: -> @hours
  getDay: -> @day
  getHalakimIntoDay: -> @halakimIntoDay
  advance: (months) -> new Molad(@totalHalakim + months * Molad.LUNAR_CYCLE)

(->
  @HALAKIM_PER_HOUR = 1080
  @HALAKIM_PER_DAY = @HALAKIM_PER_HOUR * 24
  @HALAKIM_PER_WEEK = @HALAKIM_PER_DAY * 7

  @LUNAR_CYCLE = 29 * @HALAKIM_PER_DAY + 12 * @HALAKIM_PER_HOUR + 793

  @EPOCH = { molad: new Molad(-10 * @HALAKIM_PER_HOUR), year: 2, gregorianDate: new Date(-3759, 7, 27)}
  @leapMonthsSinceEpoch = (hebrewYear) -> leapMonthsInHistory(hebrewYear) - leapMonthsInHistory(@EPOCH.year)
  @monthSinceEpoch = (hebrewYear) -> (hebrewYear - @EPOCH.year) * 12 + @leapMonthsSinceEpoch(hebrewYear)
  @daysSinceEpoch = (hebrewYear) -> parseInt(((@monthSinceEpoch(hebrewYear) * @LUNAR_CYCLE) + @EPOCH.molad.halakimIntoDay) / @HALAKIM_PER_DAY)
  @ofRoshHashanah = @ofRoshHaShanah = @ofRoshHashana = @ofRoshHaShana = (hebrewYear) -> @EPOCH.molad.advance(@monthSinceEpoch(hebrewYear))
).call(Molad)

(exports ? this).Molad = Molad
