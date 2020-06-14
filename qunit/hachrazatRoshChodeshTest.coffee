hachrazatRoshChodeshTest = (date, month, days, molad) ->
  QUnit.test "Rosh Chodesh following #{date} is #{days} and the molad #{molad}", (assert) ->
    actual = new HachrazatRoshChodesh(new HebrewDate(date))
    assert.equal actual.sephardicAnnouncement(), "בְּסִימַן טוֹב יְהֵא לָנוּ רֹאשׁ חֹדֶשׁ #{month} #{days}"
    assert.equal actual.ashkenazicAnnouncement(), "רֹאשׁ חֹדֶשׁ #{month} יִהְיֶה #{days} הַבָּא עָלֵינוּ וְעַל כָּל-יִשְׂרָאֵל לְטוֹבָה"
    assert.equal actual.moladAnnouncement(), "The מוֹלַד of חֹדֶשׁ #{month} #{molad}"

hachrazatRoshChodeshTest(new Date(2013,0,1), "שְׁבָט", "בְּיוֹם שַּׁבָּת קֹדֶשׁ", "will be on שַּׁבָּת at 4:53AM and 12 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2014,9,18), "מַרְחֶשְׁוָן", "בְּיוֹם הַשִּׁשִּׁי וּבְיוֹם שַּׁבָּת קֹדֶשׁ", "will be on Thursday night at 9:02PM and 16 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2014,10,22), "כִּסְלֵו", "בְּיוֹם רִאשׁוֹן", "is [today] שַּׁבָּת at 9:46AM and 17 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2014,11,20), "טֵבֵת", "בְּיוֹם שֵׁנִי וּבְיוֹם שְׁלִישִׁי", "will be on Sunday night at 10:31PM and 0 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2015,0,17), "שְׁבָט", "בְּיוֹם רְבִיעִי", "will be on Tuesday at 11:15AM and 1 חֵלֶק")
hachrazatRoshChodeshTest(new Date(2015,1,14), "אֲדָר", "בְּיוֹם חֲמִישִׁי וּבְיוֹם הַשִּׁשִּׁי", "will be on Wednesday night at 11:59PM and 2 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2015,6,14), "אָב", "בְּיוֹם הַשִּׁשִּׁי", "will be on Thursday at 3:39PM and 7 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2015,7,14), "אֱלוּל", "בְּיוֹם שַּׁבָּת קֹדֶשׁ וּבְיוֹם רִאשׁוֹן", "will be on שַּׁבָּת at 4:23AM and 8 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2015,11,14), "שְׁבָט", "בְּיוֹם שֵׁנִי", "will be on מוֹצָאֵי שַּׁבָּת at 8:03PM and 13 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2016,4,1), "אִיָּר", "בְּיוֹם רִאשׁוֹן וּבְיוֹם שֵׁנִי", "was on לֵיל שַּׁבָּת at 10:59PM and 17 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2019,8,28), "תִּשְׁרִי", "בְּיוֹם שֵׁנִי", "will be on Monday at 8:17AM and 10 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2020,0,1), "שְׁבָט", "בְּיוֹם שֵׁנִי", "is [today] שַּׁבָּת at 8:46AM and 9 חָלָקִים")
hachrazatRoshChodeshTest(new Date(2020,4,20), "סִיוָן", "בְּיוֹם רִאשׁוֹן", "was on Friday at 11:42AM and 13 חָלָקִים")
