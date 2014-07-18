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
