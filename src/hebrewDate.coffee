class HebrewDate

(->
  @HELPERS = {
    incrementDate: (date, length) -> date.setDate(date.getDate() + length)
  }
).call(HebrewDate)

(exports ? this).HebrewDate = HebrewDate
