hachrazatRoshChodeshTest = (date, month, days, molad) ->
  QUnit.test "Rosh Chodesh following #{date} is #{days} and the molad is #{molad}", (assert) ->
    actual = new HachrazatRoshChodesh(new HebrewDate(date))
    assert.equal actual.sephardicAnnouncement(), "בְּסִימַן טוֹב יְהֵא לָנוּ רֹאשׁ חֹדֶשׁ #{month} #{days}"
    assert.equal actual.ashkenazicAnnouncement(), "רֹאשׁ חֹדֶשׁ #{month} יִהְיֶה #{days} הַבָּא עָלֵינוּ וְעַל כָּל-יִשְׂרָאֵל לְטוֹבָה"
    assert.equal actual.moladAnnouncement(), "The מוֹלַד of חֹדֶשׁ #{month} will be on #{molad}"

hachrazatRoshChodeshTest(new Date(2013,0,1), "שְׁבָט", "בְּיוֹם שַּׁבָּת קֹדֶשׁ", "שַּׁבָּת at 4:53AM and 12 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2014,9,18), "מַרְחֶשְׁוָן", "בְּיוֹם הַשִּׁשִּׁי וּבְיוֹם שַּׁבָּת קֹדֶשׁ", "Thursday night at 9:02PM and 16 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2014,10,22), "כִּסְלֵו", "בְּיוֹם רִאשׁוֹן", "שַּׁבָּת at 9:46AM and 17 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2014,11,20), "טֵבֵת", "בְּיוֹם שֵׁנִי וּבְיוֹם שְׁלִישִׁי", "Sunday night at 10:31PM and 0 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2015,0,17), "שְׁבָט", "בְּיוֹם רְבִיעִי", "Tuesday at 11:15AM and 1 חֵלֶק")
hachrazatRoshChodeshTest(new Date(2015,1,14), "אֲדָר", "בְּיוֹם חֲמִישִׁי וּבְיוֹם הַשִּׁשִּׁי", "Wednesday night at 11:59PM and 2 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2015,6,14), "אָב", "בְּיוֹם הַשִּׁשִּׁי", "Thursday at 3:39PM and 7 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2015,7,14), "אֱלוּל", "בְּיוֹם שַּׁבָּת קֹדֶשׁ וּבְיוֹם רִאשׁוֹן", "שַּׁבָּת at 4:23AM and 8 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2015,11,14), "שְׁבָט", "בְּיוֹם שֵׁנִי", "מוֹצָאֵי שַּׁבָּת at 8:03PM and 13 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2016,4,1), "אִיָּר", "בְּיוֹם רִאשׁוֹן וּבְיוֹם שֵׁנִי", "לֵיל שַּׁבָּת at 10:59PM and 17 חָלָקִים")
