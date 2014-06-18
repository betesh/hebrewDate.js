###
  Molad takes a number of halakim as its sole constructor argument.
  Halakim of 0 indicates 6PM Friday night.
  Note that getDay() returns an integer using the same convention as Javascript's Date class--i.e. 0 == Sunday, 1 == Monday, etc.
  However, the constructor argument counts from Friday night because that is the convention in halachic literature.
###

positive_modulus = (a,b) -> ((a % b) + b) % b

class Molad
  constructor: (totalHalakim) ->
    @totalHalakim = positive_modulus(totalHalakim, Molad.HALAKIM_PER_WEEK)
    @halakim = @totalHalakim % Molad.HALAKIM_PER_HOUR
    @hours = Math.floor(@totalHalakim / Molad.HALAKIM_PER_HOUR) % 24
    @day = positive_modulus(Math.floor(totalHalakim / Molad.HALAKIM_PER_DAY) + 6, 7)
  getHalakim: -> @halakim
  getHours: -> @hours
  getDay: -> @day

(->
  @HALAKIM_PER_HOUR = 1080
  @HALAKIM_PER_DAY = @HALAKIM_PER_HOUR * 24
  @HALAKIM_PER_WEEK = @HALAKIM_PER_DAY * 7
).call(Molad)

(exports ? this).Molad = Molad
