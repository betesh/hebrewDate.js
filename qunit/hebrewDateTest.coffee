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
  otherOccasions.all ?= []
  before = new Date(date)
  before.setDate(before.getDate() - 1)
  after = new Date(date)
  after.setDate(after.getDate() + 1)
  assertNotChag(name, before, (otherOccasions.before ? []).concat(otherOccasions.all))
  assertIsChag(name, date, (otherOccasions.during ? []).concat(otherOccasions.all))
  assertNotChag(name, after, (otherOccasions.after ? []).concat(otherOccasions.all))

edgeTestMultiDayChag = (name, date, length, otherOccasions = {}) ->
  otherOccasions.all ?= []
  otherOccasions.during ?= []
  otherOccasions.around ?= []
  before = new Date(date)
  before.setDate(before.getDate() - 1)
  assertNotChag(name, before, (otherOccasions.before ? []).concat(otherOccasions.all, otherOccasions.around))
  for i in [1..length]
    assertIsChag(name, new Date(date), (otherOccasions["#{i}"] ? []).concat(otherOccasions.all, otherOccasions.during))
    date.setDate(date.getDate() + 1)
  assertNotChag(name, date, (otherOccasions.after ? []).concat(otherOccasions.all, otherOccasions.around))

shabbatTest = ->
  edgeTestOneDayChag('Shabbat', new Date(2014,6,19), before: ['ErebShabbat'])
  edgeTestOneDayChag('Shabbat', new Date(2014,6,26), before: ['ErebShabbat'])

purimTest = ->
  edgeTestOneDayChag('Purim', new Date(2013,1,24), before: ['Shabbat'], after: ['ShushanPurim'])
  edgeTestOneDayChag('Purim', new Date(2014,2,16), before: ['Shabbat'], after: ['ShushanPurim'])
  assertNotChag('Purim', new Date(2014,1,14), ['PurimKatan', 'ErebShabbat'])
  edgeTestOneDayChag('ShushanPurim', new Date(2013,1,25), before: ['Purim'])
  edgeTestOneDayChag('ShushanPurim', new Date(2014,2,17), before: ['Purim'])
  edgeTestOneDayChag('PurimKatan', new Date(2014,1,14), during: ['ErebShabbat'], after: ['ShushanPurimKatan', 'Shabbat'])
  edgeTestOneDayChag('ShushanPurimKatan', new Date(2014,1,15), during: ['Shabbat'], before: ['PurimKatan', 'ErebShabbat'])

moedTest = ->
  edgeTestMultiDayChag('Moed', new Date(2014,3,17), 4, all: ['Pesach', 'Regel'], around: ['YomTob'], '2': ['ErebShabbat'], '3': ['Shabbat'], '4': ['ErebYomTob'])
  edgeTestMultiDayChag('Moed', new Date(2014,9,11), 5, all: ['Sukkot', 'Regel'], around: ['YomTob'], before: ['ErebShabbat'], '1': ['Shabbat'], '5': ['ErebYomTob'])

pesachTest = ->
  edgeTestMultiDayChag('Pesach', new Date(2013,2,26), 8, before: ['ErebYomTob'], '1': ['YomTob'], '2': ['YomTob'], '3': ['Moed'], '4': ['Moed', 'ErebShabbat'], '5': ['Moed','Shabbat'], '6': ['Moed', 'ErebYomTob'], '7': ['YomTob'], '8': ['YomTob'], during: ['Regel'])
  edgeTestMultiDayChag('Pesach', new Date(2015,3,4), 8, before: ['ErebShabbat', 'ErebYomTob'], '1': ['Shabbat', 'YomTob'], '2': ['YomTob'], '3': ['Moed'], '4': ['Moed'], '5': ['Moed'], '6': ['Moed', 'ErebYomTob'], '7': ['YomTob', 'ErebShabbat'], '8': ['Shabbat', 'YomTob'], during: ['Regel'])

shabuotTest = ->
  edgeTestMultiDayChag('Shabuot', new Date(2013,4,15), 2, before: ['ErebYomTob'], during: ['Regel', 'YomTob'], after: ['ErebShabbat'])
  edgeTestMultiDayChag('Shabuot', new Date(2015,4,24), 2, before: ['Shabbat', 'ErebYomTob'], during: ['Regel', 'YomTob'])

roshHashanaTest = ->
  edgeTestMultiDayChag('RoshHashana', new Date(2011,8,29), 2, before: ['ErebYomTob'], during: ['10DaysOfTeshuba', 'YomTob'], '2': ['ErebShabbat'], after: ['Shabbat', '10DaysOfTeshuba'])
  edgeTestMultiDayChag('RoshHashana', new Date(2015,8,14), 2, before: ['ErebYomTob'], during: ['10DaysOfTeshuba', 'YomTob'], after: ['10DaysOfTeshuba'])

tenDaysOfTeshubaTest = ->
  edgeTestMultiDayChag('10DaysOfTeshuba', new Date(2011,8,29), 10, before: ['ErebYomTob'], '1': ['RoshHashana', 'YomTob'], '2': ['RoshHashana', 'YomTob', 'ErebShabbat'], '3': ['Shabbat'], '9': ['ErebShabbat'], '10': ['Shabbat', 'YomKippur'])
  edgeTestMultiDayChag('10DaysOfTeshuba', new Date(2015,8,14), 10, before: ['ErebYomTob'], '1': ['RoshHashana', 'YomTob'], '2': ['RoshHashana', 'YomTob'], '5': ['ErebShabbat'], '6': ['Shabbat'], '10': ['YomKippur'])

yomKippurTest = ->
  edgeTestMultiDayChag('YomKippur', new Date(2011,9,8), 1, before: ['10DaysOfTeshuba', 'ErebShabbat'], '1': ['Shabbat', '10DaysOfTeshuba'])
  edgeTestMultiDayChag('YomKippur', new Date(2015,8,23), 1, before: ['10DaysOfTeshuba'], '1': ['10DaysOfTeshuba'])

sukkotTest = ->
  edgeTestMultiDayChag('Sukkot', new Date(2011,9,13), 9, before: ['ErebYomTob'], '1': ['YomTob'], '2': ['YomTob', 'ErebShabbat'], '3': ['Moed', 'Shabbat'], '4': ['Moed'], '5': ['Moed'], '6': ['Moed'], '7': ['Moed', 'ErebYomTob'], '8': ['YomTob'], '9': ['YomTob', 'ErebShabbat'], after: ['Shabbat'], during: ['Regel'])
  edgeTestMultiDayChag('Sukkot', new Date(2015,8,28), 9, before: ['ErebYomTob'], '1': ['YomTob'], '2': ['YomTob'], '3': ['Moed'], '4': ['Moed'], '5': ['Moed', 'ErebShabbat'], '6': ['Moed','Shabbat'], '7': ['Moed', 'ErebYomTob'], '8': ['YomTob'], '9': ['YomTob'], during: ['Regel'])

chanukkahTest = ->
  edgeTestMultiDayChag('Chanukkah', new Date(2011,11,21), 8, '3': ['ErebShabbat'], '4': ['Shabbat'], '6': ['RoshHodesh'], '7': ['RoshHodesh'])
  edgeTestMultiDayChag('Chanukkah', new Date(2012,11,9), 8, '6': ['RoshHodesh', 'ErebShabbat'], '7': ['Shabbat'], before: ['Shabbat'])
  edgeTestMultiDayChag('Chanukkah', new Date(2013,10,28), 8, '2': ['ErebShabbat'], '3': ['Shabbat'], '6': ['RoshHodesh'], '7': ['RoshHodesh', 'BeginTalUmatar'], after: ['ErebShabbat'])

beginTalUmatarTest = ->
  edgeTestOneDayChag('BeginTalUmatar', new Date(1898,11,3), before: ['ErebShabbat'], during: ['Shabbat'])
  edgeTestOneDayChag('BeginTalUmatar', new Date(1899,11,4), before: ['RoshHodesh', 'Chanukkah'], during: ['Chanukkah'])
  edgeTestOneDayChag('BeginTalUmatar', new Date(1999,11,5), all: ['Chanukkah'], before: ['Shabbat'])
  edgeTestOneDayChag('BeginTalUmatar', new Date(2010,11,4), all: ['Chanukkah'], before: ['ErebShabbat'], during: ['Shabbat'])
  edgeTestOneDayChag('BeginTalUmatar', new Date(2011,11,5))
  edgeTestOneDayChag('BeginTalUmatar', new Date(2012,11,4))
  edgeTestOneDayChag('BeginTalUmatar', new Date(2013,11,4), all: ['Chanukkah'], before: ['RoshHodesh'], during: ['RoshHodesh'])
  edgeTestOneDayChag('BeginTalUmatar', new Date(2099,11,5), before: ['ErebShabbat'], during: ['Shabbat'])
  edgeTestOneDayChag('BeginTalUmatar', new Date(2100,11,5), before: ['Shabbat'])
  edgeTestOneDayChag('BeginTalUmatar', new Date(2101,11,5))
  edgeTestOneDayChag('BeginTalUmatar', new Date(2102,11,5), after: ['Chanukkah'])
  edgeTestOneDayChag('BeginTalUmatar', new Date(2103,11,6), after: ['ErebShabbat'])

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
chanukkahTest()
beginTalUmatarTest()
