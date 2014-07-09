increment_date = (date, length) -> date.setDate(date.getDate() + length)

class RoshHashana
  constructor: (hebrewYear) ->
    @molad = Molad.ofRoshHashanah(hebrewYear)
    @gregorianDateOfMolad = new Date(Molad.EPOCH.gregorianDate)
    @gregorianDateOfMolad.setDate(Molad.EPOCH.gregorianDate.getDate() + Molad.daysSinceEpoch(hebrewYear))
    @isLeapYear = (hebrewYear % 19) in RoshHashana.GUCHADZAT
    @followsLeapYear = ((hebrewYear - 1) % 19) in RoshHashana.GUCHADZAT
    dayOfWeek = @gregorianDateOfMolad.getDay()
    @dehiyot = new Array()
    @gregorianDate = new Date(@gregorianDateOfMolad)
    if dayOfWeek in RoshHashana.ADU
      @dehiyot.push('ADU')
    else
      halakim = @molad.getHalakimIntoDay()
      if halakim > RoshHashana.MOLAD_ZAQEN
        @dehiyot.push('MOLAD ZAQEN')
      else if 2 == dayOfWeek && halakim > RoshHashana.TARAD && !@isLeapYear
        @dehiyot.push('GATARAD')
      else if 1 == dayOfWeek && halakim > RoshHashana.TUTAKPAT && @followsLeapYear
        @dehiyot.push('BETUTAKPAT')
      @dehiyot.push('ADU') if 1 == @dehiyot.length && ((dayOfWeek + 1) % 7) in RoshHashana.ADU
    increment_date(@gregorianDate, @dehiyot.length)
  getMolad: -> @molad
  getGregorianDateOfMolad: -> @gregorianDateOfMolad
  getGregorianDate: -> @gregorianDate

(->
  @GUCHADZAT = [3,6,8,11,14,17,19]
  @ADU = [0,3,5]

  @TARAD = Molad.HALAKIM_PER_HOUR * 9 + 204
  @TUTAKPAT = Molad.HALAKIM_PER_HOUR * 15 + 589
  @MOLAD_ZAQEN = 18 * Molad.HALAKIM_PER_HOUR
).call(RoshHashana)

(exports ? this).RoshHaShanah = (exports ? this).RoshHaShana = (exports ? this).RoshHashanah = (exports ? this).RoshHashana = RoshHashana
