assetHebrewDate = (date, hebrewYear, hebrewMonth, dayOfMonth, dayOfYear) ->
  QUnit.test "#{date} is '#{hebrewMonth.name}' #{dayOfMonth}, #{hebrewYear}", (assert) ->
    actual = new HebrewDate(date)
    assert.deepEqual actual.getYearFromCreation(), hebrewYear
    assert.deepEqual actual.getHebrewMonth().getName(), hebrewMonth.name
    assert.deepEqual actual.getDayOfMonth(), dayOfMonth
    assert.deepEqual actual.getDayOfYear(), dayOfYear

assertChag = (name, date, _is) ->
  QUnit.test "#{date} is #{if _is then '' else 'not'} #{name}", (assert) ->
    result = new HebrewDate(date)["is#{name}"]()
    assert.ok(if _is then result else !result)

assertIsChag = (name, date) -> assertChag(name, date, true)
assertNotChag = (name, date) -> assertChag(name, date, false)

edgeTestOneDayChag = (name, date) ->
  before = new Date(date)
  before.setDate(before.getDate() - 1)
  after = new Date(date)
  after.setDate(after.getDate() + 1)
  assertNotChag(name, before)
  assertIsChag(name, date)
  assertNotChag(name, after)

shabbatTest = ->
  edgeTestOneDayChag('Shabbat', new Date(2014,6,19))
  edgeTestOneDayChag('Shabbat', new Date(2014,6,26))

purimTest = ->
  edgeTestOneDayChag('Purim', new Date(2014,2,16))
  assertNotChag('Purim', new Date(2014,1,14))
  edgeTestOneDayChag('Purim', new Date(2013,1,24))

assetHebrewDate(new Date(2014,6,20), 5774, HebrewMonth.TAMUZ, 22, 319)
assetHebrewDate(new Date(2014,4,12), 5774, HebrewMonth.IYAR, 12, 250)

shabbatTest()
purimTest()
