class HebrewDate

(->
  @HELPERS = {
    incrementDate: (date, length) -> date.setDate(date.getDate() + length)
    durationInGregorianDays: (end_date, begin_date) -> (end_date - begin_date) / 1000 / 60 / 60 / 24
    durationInHebrewDays: (end_date, begin_date) -> @durationInGregorianDays(end_date.getGregorianDate(), begin_date.getGregorianDate())
  }
).call(HebrewDate)

(exports ? this).HebrewDate = HebrewDate
