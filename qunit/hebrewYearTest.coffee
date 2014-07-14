assertHebrewYear = (date, hebrewYear, daysInYear) ->
  QUnit.test "Hebrew Year of #{date}", (assert) ->
    actual = new HebrewYear(date)
    assert.deepEqual actual.getYearFromCreation(), hebrewYear
    assert.deepEqual actual.getThisRoshHashana(), new RoshHashana(hebrewYear)
    assert.deepEqual actual.getNextRoshHashana(), new RoshHashana(hebrewYear + 1)
    assert.deepEqual actual.getDaysInYear(), daysInYear
    assert.deepEqual actual.isLeapYear(), daysInYear > 355
    assert.deepEqual actual.getMonthsInYear(), if daysInYear > 355 then 13 else 12

assertHebrewYear(new Date(2012,8,16), 5772, 354)
assertHebrewYear(new Date(2012,8,17), 5773, 353)

assertHebrewYear(new Date(2013,8,4), 5773, 353)
assertHebrewYear(new Date(2013,8,5), 5774, 385)

assertHebrewYear(new Date(2014,8,24), 5774, 385)
assertHebrewYear(new Date(2014,8,25), 5775, 354)

assertHebrewYear(new Date(2015,8,13), 5775, 354)
assertHebrewYear(new Date(2015,8,14), 5776, 385)
