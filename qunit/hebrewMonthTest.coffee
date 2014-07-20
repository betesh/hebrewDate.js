hebrew_year_of = (year) -> new RoshHashana(year).getHebrewYear()

assertMonthNames = ->
  QUnit.test "Month names", (assert) ->
    assert.deepEqual HebrewMonth.NAMES[0], "תִּשׁרִי"
    assert.deepEqual HebrewMonth.NAMES[11], "אֱלוּל"
    assert.deepEqual HebrewMonth.NAMES.length, 12

assertMonthsArray = ->
  QUnit.test "Months Array", (assert) ->
    assert.deepEqual HebrewMonth.MONTHS.PESHUTA[0], HebrewMonth.TISHRI
    assert.deepEqual HebrewMonth.MONTHS.PESHUTA[5], HebrewMonth.ADAR
    assert.deepEqual HebrewMonth.MONTHS.PESHUTA[6], HebrewMonth.NISSAN
    assert.deepEqual HebrewMonth.MONTHS.PESHUTA[11], HebrewMonth.ELUL
    assert.deepEqual HebrewMonth.MONTHS.PESHUTA.length, 12

  QUnit.test "Months in Leap Year Array", (assert) ->
    assert.deepEqual HebrewMonth.MONTHS.MEUBERET[0], HebrewMonth.TISHRI
    assert.deepEqual HebrewMonth.MONTHS.MEUBERET[5], HebrewMonth.ADAR_RISHON
    assert.deepEqual HebrewMonth.MONTHS.MEUBERET[6], HebrewMonth.ADAR_SHENI
    assert.deepEqual HebrewMonth.MONTHS.MEUBERET[7], HebrewMonth.NISSAN
    assert.deepEqual HebrewMonth.MONTHS.MEUBERET[12], HebrewMonth.ELUL
    assert.deepEqual HebrewMonth.MONTHS.MEUBERET.length, 13

assertMonthLengths = ->
  QUnit.test "Month lengths", (assert) ->
    male_meuberet = hebrew_year_of(5774)
    assert.deepEqual HebrewMonth.TISHRI.length(male_meuberet), 30
    assert.deepEqual HebrewMonth.HESHVAN.length(male_meuberet), 30
    assert.deepEqual HebrewMonth.KISLEV.length(male_meuberet), 30
    assert.deepEqual HebrewMonth.TEVET.length(male_meuberet), 29
    assert.deepEqual HebrewMonth.ADAR.length(male_meuberet), null
    assert.deepEqual HebrewMonth.ADAR_RISHON.length(male_meuberet), 30
    assert.deepEqual HebrewMonth.ADAR_SHENI.length(male_meuberet), 29

    ragil_peshutah = hebrew_year_of(5775)
    assert.deepEqual HebrewMonth.HESHVAN.length(ragil_peshutah), 29
    assert.deepEqual HebrewMonth.KISLEV.length(ragil_peshutah), 30

    haser_peshutah = hebrew_year_of(5773)
    assert.deepEqual HebrewMonth.TISHRI.length(haser_peshutah), 30
    assert.deepEqual HebrewMonth.HESHVAN.length(haser_peshutah), 29
    assert.deepEqual HebrewMonth.KISLEV.length(haser_peshutah), 29
    assert.deepEqual HebrewMonth.TEVET.length(haser_peshutah), 29
    assert.deepEqual HebrewMonth.ADAR.length(haser_peshutah), 29
    assert.deepEqual HebrewMonth.ADAR_RISHON.length(haser_peshutah), null
    assert.deepEqual HebrewMonth.ADAR_SHENI.length(haser_peshutah), null

assertHebrewMonth = (year, month, length, name, gregorianDateOfThisRoshHodesh, gregorianDateOfNextRoshHodesh) ->
  QUnit.test "Month #{month} of year #{year}", (assert) ->
    actual = new HebrewMonth(hebrew_year_of(year), month)
    assert.deepEqual actual.getLength(), length
    assert.deepEqual actual.getName(), name
    assert.deepEqual actual.getThisRoshHodesh(), gregorianDateOfThisRoshHodesh
    assert.deepEqual actual.getNextRoshHodesh(), gregorianDateOfNextRoshHodesh

assertMonthNames()
assertMonthsArray()
assertMonthLengths()

assertHebrewMonth(5773, 0, 30, "תִּשׁרִי", new Date(2012,8,17), new Date(2012,9,17))
assertHebrewMonth(5773, 1, 29, "מַרְחֶשְׁוָן", new Date(2012,9,17), new Date(2012,10,15))

assertHebrewMonth(5774, 0, 30, "תִּשׁרִי", new Date(2013,8,5), new Date(2013,9,5))
assertHebrewMonth(5774, 1, 30, "מַרְחֶשְׁוָן", new Date(2013,9,5), new Date(2013,10,4))
assertHebrewMonth(5774, 2, 30, "כִּסְלֵו", new Date(2013,10,4), new Date(2013,11,4))
assertHebrewMonth(5774, 3, 29, "טֵבֵת", new Date(2013,11,4), new Date(2014,0,2))
assertHebrewMonth(5774, 4, 30, "שְׁבָט", new Date(2014,0,2), new Date(2014,1,1))
assertHebrewMonth(5774, 5, 30, "אֲדָר רִאשׁוֹן", new Date(2014,1,1), new Date(2014,2,3))
assertHebrewMonth(5774, 6, 29, "אֲדָר שֵׁנִי", new Date(2014,2,3), new Date(2014,3,1))
assertHebrewMonth(5774, 7, 30, "נִיסָן", new Date(2014,3,1), new Date(2014,4,1))
assertHebrewMonth(5774, 8, 29, "אִיָּר", new Date(2014,4,1), new Date(2014,4,30))
assertHebrewMonth(5774, 9, 30, "סִיוָן", new Date(2014,4,30), new Date(2014,5,29))
assertHebrewMonth(5774, 10, 29, "תַּמּוּז", new Date(2014,5,29), new Date(2014,6,28))
assertHebrewMonth(5774, 11, 30, "אָב", new Date(2014,6,28), new Date(2014,7,27))
assertHebrewMonth(5774, 12, 29, "אֱלוּל", new Date(2014,7,27), new Date(2014,8,25))

assertHebrewMonth(5775, 0, 30, "תִּשׁרִי", new Date(2014,8,25), new Date(2014,9,25))
assertHebrewMonth(5775, 1, 29, "מַרְחֶשְׁוָן", new Date(2014,9,25), new Date(2014,10,23))
assertHebrewMonth(5775, 2, 30, "כִּסְלֵו", new Date(2014,10,23), new Date(2014,11,23))
assertHebrewMonth(5775, 3, 29, "טֵבֵת", new Date(2014,11,23), new Date(2015,0,21))
assertHebrewMonth(5775, 4, 30, "שְׁבָט", new Date(2015,0,21), new Date(2015,1,20))
assertHebrewMonth(5775, 5, 29, "אֲדָר", new Date(2015,1,20), new Date(2015,2,21))
assertHebrewMonth(5775, 6, 30, "נִיסָן", new Date(2015,2,21), new Date(2015,3,20))
assertHebrewMonth(5775, 7, 29, "אִיָּר", new Date(2015,3,20), new Date(2015,4,19))
assertHebrewMonth(5775, 8, 30, "סִיוָן", new Date(2015,4,19), new Date(2015,5,18))
assertHebrewMonth(5775, 9, 29, "תַּמּוּז", new Date(2015,5,18), new Date(2015,6,17))
assertHebrewMonth(5775, 10, 30, "אָב", new Date(2015,6,17), new Date(2015,7,16))
assertHebrewMonth(5775, 11, 29, "אֱלוּל", new Date(2015,7,16), new Date(2015,8,14))
