assertMolad = (description, arg, halakim, hours, day) ->
  QUnit.test description, (assert) ->
    molad = if arg instanceof Molad then arg else new Molad(arg)
    assert.deepEqual molad.getHalakim(), halakim
    assert.deepEqual molad.getHours(), hours
    assert.deepEqual molad.getDay(), day

assertMolad("Molad Friday night 1 helek", 1, 1, 0, 6)
assertMolad("Molad Friday night 1079 halakim", 1079, 1079, 0, 6)
assertMolad("Molad Friday night 1080 halakim rolls over to 1 hour", 1080, 0, 1, 6)
assertMolad("Molad Saturday morning 12 hours and 1 helek", 1080 * 12 + 1, 1, 12, 6)
assertMolad("Molad Saturday night 1 helek", 1080 * 24 + 1, 1, 0, 0)
assertMolad("Molad Monday afternoon 18 hours and 149 halakim", (1080 * 24 * 2) + 1080 * 18 + 149, 149, 18, 1)
assertMolad("Molad Monday afternoon 23 hours and 1079 halakim", (1080 * 24 * 2) + 1080 * 23 + 1079, 1079, 23, 1)
assertMolad("Molad Monday afternoon 23 hours and 1080 halakim rolls over to Tuesday", (1080 * 24 * 2) + 1080 * 23 + 1080, 0, 0, 2)
assertMolad("Molad Friday afternoon 23 hours and 1079 halakim", (1080 * 24 * 6) + 1080 * 23 + 1079, 1079, 23, 5)
assertMolad("Molad Friday afternoon 23 hours and 1080 halakim rolls over to Saturday", (1080 * 24 * 6) + 1080 * 23 + 1080, 0, 0, 6)
assertMolad("advance 1 month", new Molad(0).advance(1), 793, 12, 0)
assertMolad("recede 1 month", new Molad(0).advance(-1), 1080 - 793, 11, 4)
assertMolad("advance 12 months", new Molad(0).advance(12), 1080 - 204, 8, 3)
assertMolad("recede 12 months", new Molad(0).advance(-12), 204, 15, 1)
assertMolad("advance 13 months", new Molad(0).advance(13), 589, 21, 4)
assertMolad("recede 13 months", new Molad(0).advance(-13), 1080 - 589, 2, 0)
