assertRoshHashana = (hebrewYear, molad, dateOfMolad, dateOfRoshHashana, dehiyot) ->
  QUnit.test "Rosh Hashana #{hebrewYear}", (assert) ->
    actual = new RoshHashana(hebrewYear)
    assert.deepEqual actual.getMolad(), molad
    assert.deepEqual actual.getGregorianDateOfMolad(), dateOfMolad
    assert.deepEqual actual.getGregorianDate(), dateOfRoshHashana
    assert.deepEqual actual.dehiyot, dehiyot

assertRoshHashana(5773, new Molad(1 * Molad.HALAKIM_PER_DAY + 7 * Molad.HALAKIM_PER_HOUR + 57*18 + 8), new Date(2012,8,16), new Date(2012,8,17), ['ADU'])
assertRoshHashana(5774, new Molad(5 * Molad.HALAKIM_PER_DAY + 16 * Molad.HALAKIM_PER_HOUR + 46 * 18 + 2), new Date(2013,8,5), new Date(2013,8,5), [])
assertRoshHashana(5775, new Molad(4 * Molad.HALAKIM_PER_DAY + 14 * Molad.HALAKIM_PER_HOUR + 18 * 18 + 15), new Date(2014,8,24), new Date(2014,8,25), ['ADU'])
assertRoshHashana(5776, new Molad(1 * Molad.HALAKIM_PER_DAY + 23 * Molad.HALAKIM_PER_HOUR + 7 * 18 + 9), new Date(2015,8,13), new Date(2015,8,14), ['ADU'])
assertRoshHashana(5777, new Molad(0 * Molad.HALAKIM_PER_DAY + 20 * Molad.HALAKIM_PER_HOUR + 724), new Date(2016,9,1), new Date(2016,9,3), ['MOLAD ZAQEN', 'ADU'])
