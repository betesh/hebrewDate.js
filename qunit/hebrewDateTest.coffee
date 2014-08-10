assetHebrewDate = (date, hebrewYear, hebrewMonth, dayOfMonth, dayOfYear) ->
  QUnit.test "#{date} is '#{hebrewMonth.name}' #{dayOfMonth}, #{hebrewYear}", (assert) ->
    actual = new HebrewDate(date)
    assert.deepEqual actual.getYearFromCreation(), hebrewYear
    assert.deepEqual actual.getHebrewMonth().getName(), hebrewMonth.name
    assert.deepEqual actual.getDayOfMonth(), dayOfMonth
    assert.deepEqual actual.getDayOfYear(), dayOfYear

assertChag = (name, date, otherOccasions = [], _is) ->
  QUnit.test "#{date} is #{if _is then '' else 'not'} #{name}", (assert) ->
    target = new HebrewDate(date)
    result = target["is#{name}"]()
    assert.ok(if _is then result else !result)
    otherOccasions.push(name) if _is
    assert.deepEqual target.occasions(), otherOccasions.sort()

assertIsChag = (name, date, otherOccasions) -> assertChag(name, date, otherOccasions, true)
assertNotChag = (name, date, otherOccasions) -> assertChag(name, date, otherOccasions, false)

edgeTestOneDayChag = (name, date, otherOccasions = {}) ->
  before = new Date(date)
  before.setDate(before.getDate() - 1)
  after = new Date(date)
  after.setDate(after.getDate() + 1)
  assertNotChag(name, before, otherOccasions.before)
  assertIsChag(name, date, otherOccasions.date)
  assertNotChag(name, after, otherOccasions.after)

edgeTestMultiDayChag = (name, date, length, otherOccasions = {}) ->
  otherOccasions.all ?= []
  before = new Date(date)
  before.setDate(before.getDate() - 1)
  assertNotChag(name, before, (otherOccasions.before ? []).concat(otherOccasions.all))
  for i in [1..length]
    assertIsChag(name, new Date(date), (otherOccasions["#{i}"] ? []).concat(otherOccasions.all))
    date.setDate(date.getDate() + 1)
  assertNotChag(name, date, (otherOccasions.after ? []).concat(otherOccasions['all']))

shabbatTest = ->
  edgeTestOneDayChag('Shabbat', new Date(2014,6,19))
  edgeTestOneDayChag('Shabbat', new Date(2014,6,26))

purimTest = ->
  edgeTestOneDayChag('Purim', new Date(2014,2,16), before: ['Shabbat'])
  assertNotChag('Purim', new Date(2014,1,14))
  edgeTestOneDayChag('Purim', new Date(2013,1,24), before: ['Shabbat'])

moedTest = ->
  edgeTestMultiDayChag('Moed', new Date(2014,3,17),4,all: ['Pesach'], '3': ['Shabbat'])
  edgeTestMultiDayChag('Moed', new Date(2014,9,11),5,all: ['Sukkot'], '1': ['Shabbat'])

pesachTest = ->
  edgeTestMultiDayChag('Pesach', new Date(2013,2,26),8,'3': ['Moed'], '4': ['Moed'], '5': ['Moed','Shabbat'], '6': ['Moed'])
  edgeTestMultiDayChag('Pesach', new Date(2015,3,4),8,'1': ['Shabbat'], '3': ['Moed'], '4': ['Moed'], '5': ['Moed'], '6': ['Moed'], '8': ['Shabbat'])

shabuotTest = ->
  edgeTestMultiDayChag('Shabuot', new Date(2013,4,15),2)
  edgeTestMultiDayChag('Shabuot', new Date(2015,4,24),2, before:['Shabbat'])

roshHashanaTest = ->
  edgeTestMultiDayChag('RoshHashana', new Date(2011,8,29),2, '1': ['10DaysOfTeshuba'], '2': ['10DaysOfTeshuba'], after: ['Shabbat', '10DaysOfTeshuba'])
  edgeTestMultiDayChag('RoshHashana', new Date(2015,8,14),2, '1': ['10DaysOfTeshuba'], '2': ['10DaysOfTeshuba'], after: ['10DaysOfTeshuba'])

tenDaysOfTeshubaTest = ->
  edgeTestMultiDayChag('10DaysOfTeshuba', new Date(2011,8,29),10,'1': ['RoshHashana'], '2': ['RoshHashana'], '3': ['Shabbat'], '10': ['Shabbat', 'YomKippur'])
  edgeTestMultiDayChag('10DaysOfTeshuba', new Date(2015,8,14),10,'1': ['RoshHashana'], '2': ['RoshHashana'], '6': ['Shabbat'], '10': ['YomKippur'])

yomKippurTest = ->
  edgeTestMultiDayChag('YomKippur', new Date(2011,9,8),1, before: ['10DaysOfTeshuba'], '1': ['Shabbat', '10DaysOfTeshuba'])
  edgeTestMultiDayChag('YomKippur', new Date(2015,8,23),1, before: ['10DaysOfTeshuba'], '1': ['10DaysOfTeshuba'])

sukkotTest = ->
  edgeTestMultiDayChag('Sukkot', new Date(2011,9,13),9,'3': ['Moed', 'Shabbat'], '4': ['Moed'], '5': ['Moed'], '6': ['Moed'], '7': ['Moed'], after: ['Shabbat'])
  edgeTestMultiDayChag('Sukkot', new Date(2015,8,28),9,'3': ['Moed'], '4': ['Moed'], '5': ['Moed'], '6': ['Moed','Shabbat'], '7': ['Moed'])

assetHebrewDate(new Date(2014,6,20), 5774, HebrewMonth.TAMUZ, 22, 319)
assetHebrewDate(new Date(2014,4,12), 5774, HebrewMonth.IYAR, 12, 250)

shabbatTest()
purimTest()
moedTest()
pesachTest()
shabuotTest()
roshHashanaTest()
tenDaysOfTeshubaTest()
yomKippurTest()
sukkotTest()
