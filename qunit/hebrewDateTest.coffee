assetHebrewDate = (date, hebrewYear, hebrewMonth, dayOfMonth, dayOfYear) ->
  QUnit.test "#{date} is '#{hebrewMonth.name}' #{dayOfMonth}, #{hebrewYear}", (assert) ->
    actual = new HebrewDate(date)
    assert.deepEqual actual.getYearFromCreation(), hebrewYear
    assert.deepEqual actual.getHebrewMonth().getName(), hebrewMonth.name
    assert.deepEqual actual.getDayOfMonth(), dayOfMonth
    assert.deepEqual actual.getDayOfYear(), dayOfYear

assetHebrewDate(new Date(2014,6,20), 5774, HebrewMonth.TAMUZ, 22, 319)
assetHebrewDate(new Date(2014,4,12), 5774, HebrewMonth.IYAR, 12, 250)
