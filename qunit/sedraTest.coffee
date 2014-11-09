assetSedraOfDate = (date, weekOfYear, sedra) ->
  QUnit.test "#{date} is #{date.getDay()} of #{sedra}", (assert) ->
    actual = new HebrewDate(date)
    assert.equal actual.weekOfYear(), weekOfYear
    assert.equal actual.sedra(), sedra

# Still need to test:
# M2, M5
# T4, T1
# R0, R2, R5
# S0, S2, S3, S5


# 5774 -- R0
assetSedraOfDate(new Date(2014, 8, 14), 55, 'נִצָּבִים-וַיֵּלֶךְ')
assetSedraOfDate(new Date(2014, 8, 20), 55, 'נִצָּבִים-וַיֵּלֶךְ')
assetSedraOfDate(new Date(2014, 8, 21), 56, 'הַאֲזִינוּ')
assetSedraOfDate(new Date(2014, 8, 24), 56, 'הַאֲזִינוּ')

# 5775 -- R4
assetSedraOfDate(new Date(2014, 8, 25), 1, 'הַאֲזִינוּ')
assetSedraOfDate(new Date(2014, 8, 27), 1, 'הַאֲזִינוּ')
assetSedraOfDate(new Date(2014, 8, 28), 2, 'יוֹם הַכִּפֻּרִים')
assetSedraOfDate(new Date(2014, 9, 4), 2, 'יוֹם הַכִּפֻּרִים')
assetSedraOfDate(new Date(2014, 9, 5), 3, 'חַג הַסֻּכּוֹת')
assetSedraOfDate(new Date(2014, 9, 11), 3, 'חַג הַסֻּכּוֹת')
assetSedraOfDate(new Date(2014, 9, 12), 4, 'בְּרֵאשִׁית')
assetSedraOfDate(new Date(2014, 9, 18), 4, 'בְּרֵאשִׁית')
assetSedraOfDate(new Date(2014, 9, 19), 5, 'נֹחַ')
assetSedraOfDate(new Date(2014, 9, 25), 5, 'נֹחַ')
assetSedraOfDate(new Date(2014, 9, 26), 6, 'לֶךְ-לְךָ')
assetSedraOfDate(new Date(2014, 10, 1), 6, 'לֶךְ-לְךָ')
assetSedraOfDate(new Date(2014, 10, 2), 7, 'וַיֵּרָא')
assetSedraOfDate(new Date(2014, 10, 8), 7, 'וַיֵּרָא')
assetSedraOfDate(new Date(2014, 10, 9), 8, 'חַיֵּי שָׂרָה')
assetSedraOfDate(new Date(2014, 10, 15), 8, 'חַיֵּי שָׂרָה')
assetSedraOfDate(new Date(2014, 10, 16), 9, 'תּוֹלְדֹת')
assetSedraOfDate(new Date(2014, 10, 22), 9, 'תּוֹלְדֹת')
assetSedraOfDate(new Date(2014, 10, 23), 10, 'וַיֵּצֵא')
assetSedraOfDate(new Date(2014, 10, 29), 10, 'וַיֵּצֵא')
assetSedraOfDate(new Date(2014, 10, 30), 11, 'וַיִּשְׁלַח')
assetSedraOfDate(new Date(2014, 11, 6), 11, 'וַיִּשְׁלַח')
assetSedraOfDate(new Date(2014, 11, 7), 12, 'וַיֵּשֶׁב')
assetSedraOfDate(new Date(2014, 11, 13), 12, 'וַיֵּשֶׁב')
assetSedraOfDate(new Date(2014, 11, 14), 13, 'מִקֵּץ')
assetSedraOfDate(new Date(2014, 11, 20), 13, 'מִקֵּץ')
assetSedraOfDate(new Date(2014, 11, 21), 14, 'וַיִּגַּשׁ')
assetSedraOfDate(new Date(2014, 11, 27), 14, 'וַיִּגַּשׁ')
assetSedraOfDate(new Date(2014, 11, 28), 15, 'וַיְחִי')
assetSedraOfDate(new Date(2015, 0, 3), 15, 'וַיְחִי')
assetSedraOfDate(new Date(2015, 0, 4), 16, 'שְׁמוֹת')
assetSedraOfDate(new Date(2015, 0, 10), 16, 'שְׁמוֹת')
assetSedraOfDate(new Date(2015, 0, 11), 17, 'וָאֵרָא')
assetSedraOfDate(new Date(2015, 0, 17), 17, 'וָאֵרָא')
assetSedraOfDate(new Date(2015, 0, 18), 18, 'בֹּא')
assetSedraOfDate(new Date(2015, 0, 24), 18, 'בֹּא')
assetSedraOfDate(new Date(2015, 0, 25), 19, 'בְּשַׁלַּח')
assetSedraOfDate(new Date(2015, 0, 31), 19, 'בְּשַׁלַּח')
assetSedraOfDate(new Date(2015, 1, 1), 20, 'יִתְרוֹ')
assetSedraOfDate(new Date(2015, 1, 7), 20, 'יִתְרוֹ')
assetSedraOfDate(new Date(2015, 1, 8), 21, 'מִּשְׁפָּטִים')
assetSedraOfDate(new Date(2015, 1, 14), 21, 'מִּשְׁפָּטִים')
assetSedraOfDate(new Date(2015, 1, 15), 22, 'תְּרוּמָה')
assetSedraOfDate(new Date(2015, 1, 21), 22, 'תְּרוּמָה')
assetSedraOfDate(new Date(2015, 1, 22), 23, 'תְּצַוֶּה')
assetSedraOfDate(new Date(2015, 1, 28), 23, 'תְּצַוֶּה')
assetSedraOfDate(new Date(2015, 2, 1), 24, 'כִּי תִשָּׂא')
assetSedraOfDate(new Date(2015, 2, 7), 24, 'כִּי תִשָּׂא')
assetSedraOfDate(new Date(2015, 2, 8), 25, 'וַיַּקְהֵל-פְקוּדֵי')
assetSedraOfDate(new Date(2015, 2, 14), 25, 'וַיַּקְהֵל-פְקוּדֵי')
assetSedraOfDate(new Date(2015, 2, 15), 26, 'וַיִּקְרָא')
assetSedraOfDate(new Date(2015, 2, 21), 26, 'וַיִּקְרָא')
assetSedraOfDate(new Date(2015, 2, 22), 27, 'צַו')
assetSedraOfDate(new Date(2015, 2, 28), 27, 'צַו')
assetSedraOfDate(new Date(2015, 2, 29), 28, 'חַג הַפֶּסַח')
assetSedraOfDate(new Date(2015, 3, 4), 28, 'חַג הַפֶּסַח')
assetSedraOfDate(new Date(2015, 3, 5), 29, 'אַחֲרוֹן שֶׁל פֶּסַח')
assetSedraOfDate(new Date(2015, 3, 11), 29, 'אַחֲרוֹן שֶׁל פֶּסַח')
assetSedraOfDate(new Date(2015, 3, 12), 30, 'שְּׁמִינִי')
assetSedraOfDate(new Date(2015, 3, 18), 30, 'שְּׁמִינִי')
assetSedraOfDate(new Date(2015, 3, 19), 31, 'תַזְרִיעַ-מְּצֹרָע')
assetSedraOfDate(new Date(2015, 3, 25), 31, 'תַזְרִיעַ-מְּצֹרָע')
assetSedraOfDate(new Date(2015, 3, 26), 32, 'אַחֲרֵי מוֹת-קְדֹשִׁים')
assetSedraOfDate(new Date(2015, 4, 2), 32, 'אַחֲרֵי מוֹת-קְדֹשִׁים')
assetSedraOfDate(new Date(2015, 4, 3), 33, 'אֱמֹר')
assetSedraOfDate(new Date(2015, 4, 9), 33, 'אֱמֹר')
assetSedraOfDate(new Date(2015, 4, 10), 34, 'בְּהַר סִינַי-בְּחֻקֹּתַי')
assetSedraOfDate(new Date(2015, 4, 16), 34, 'בְּהַר סִינַי-בְּחֻקֹּתַי')
assetSedraOfDate(new Date(2015, 4, 17), 35, 'בְּמִדְבַּר סִינַי')
assetSedraOfDate(new Date(2015, 4, 23), 35, 'בְּמִדְבַּר סִינַי')
assetSedraOfDate(new Date(2015, 4, 24), 36, 'נָשֹׂא')
assetSedraOfDate(new Date(2015, 4, 30), 36, 'נָשֹׂא')
assetSedraOfDate(new Date(2015, 4, 31), 37, 'בְּהַעֲלֹתְךָ')
assetSedraOfDate(new Date(2015, 5, 6), 37, 'בְּהַעֲלֹתְךָ')
assetSedraOfDate(new Date(2015, 5, 7), 38, 'שְׁלַח')
assetSedraOfDate(new Date(2015, 5, 13), 38, 'שְׁלַח')
assetSedraOfDate(new Date(2015, 5, 14), 39, 'קֹרַח')
assetSedraOfDate(new Date(2015, 5, 20), 39, 'קֹרַח')
assetSedraOfDate(new Date(2015, 5, 21), 40, 'חֻקַּת')
assetSedraOfDate(new Date(2015, 5, 27), 40, 'חֻקַּת')
assetSedraOfDate(new Date(2015, 5, 28), 41, 'בָּלָק')
assetSedraOfDate(new Date(2015, 6, 4), 41, 'בָּלָק')
assetSedraOfDate(new Date(2015, 6, 5), 42, 'פִּינְחָס')
assetSedraOfDate(new Date(2015, 6, 11), 42, 'פִּינְחָס')
assetSedraOfDate(new Date(2015, 6, 12), 43, 'מַּטּוֹת-מַסְעֵי')
assetSedraOfDate(new Date(2015, 6, 18), 43, 'מַּטּוֹת-מַסְעֵי')
assetSedraOfDate(new Date(2015, 6, 19), 44, 'דְּבָרִים')
assetSedraOfDate(new Date(2015, 6, 25), 44, 'דְּבָרִים')
assetSedraOfDate(new Date(2015, 6, 26), 45, 'וָאֶתְחַנַּן')
assetSedraOfDate(new Date(2015, 7, 1), 45, 'וָאֶתְחַנַּן')
assetSedraOfDate(new Date(2015, 7, 2), 46, 'עֵקֶב')
assetSedraOfDate(new Date(2015, 7, 8), 46, 'עֵקֶב')
assetSedraOfDate(new Date(2015, 7, 9), 47, 'רְאֵה')
assetSedraOfDate(new Date(2015, 7, 15), 47, 'רְאֵה')
assetSedraOfDate(new Date(2015, 7, 16), 48, 'שֹׁפְטִים')
assetSedraOfDate(new Date(2015, 7, 22), 48, 'שֹׁפְטִים')
assetSedraOfDate(new Date(2015, 7, 23), 49, 'כִּי-תֵצֵא')
assetSedraOfDate(new Date(2015, 7, 29), 49, 'כִּי-תֵצֵא')
assetSedraOfDate(new Date(2015, 7, 30), 50, 'כִּי-תָבוֹא')
assetSedraOfDate(new Date(2015, 8, 5), 50, 'כִּי-תָבוֹא')
assetSedraOfDate(new Date(2015, 8, 6), 51, 'נִצָּבִים')
assetSedraOfDate(new Date(2015, 8, 12), 51, 'נִצָּבִים')
assetSedraOfDate(new Date(2015, 8, 13), 52, 'וַיֵּלֶךְ')

# 5776 -- M0
assetSedraOfDate(new Date(2015, 8, 14), 1, 'וַיֵּלֶךְ')
assetSedraOfDate(new Date(2015, 8, 19), 1, 'וַיֵּלֶךְ')
assetSedraOfDate(new Date(2015, 8, 20), 2, 'הַאֲזִינוּ')
assetSedraOfDate(new Date(2015, 8, 26), 2, 'הַאֲזִינוּ')
assetSedraOfDate(new Date(2015, 8, 27), 3, 'חַג הַסֻּכּוֹת')
assetSedraOfDate(new Date(2015, 9, 3), 3, 'חַג הַסֻּכּוֹת')
assetSedraOfDate(new Date(2015, 9, 4), 4, 'בְּרֵאשִׁית')
assetSedraOfDate(new Date(2015, 9, 10), 4, 'בְּרֵאשִׁית')
assetSedraOfDate(new Date(2015, 9, 11), 5, 'נֹחַ')
assetSedraOfDate(new Date(2015, 9, 17), 5, 'נֹחַ')
assetSedraOfDate(new Date(2015, 9, 18), 6, 'לֶךְ-לְךָ')
assetSedraOfDate(new Date(2015, 9, 24), 6, 'לֶךְ-לְךָ')
assetSedraOfDate(new Date(2015, 9, 25), 7, 'וַיֵּרָא')
assetSedraOfDate(new Date(2015, 9, 31), 7, 'וַיֵּרָא')
assetSedraOfDate(new Date(2015, 10, 1), 8, 'חַיֵּי שָׂרָה')
assetSedraOfDate(new Date(2015, 10, 7), 8, 'חַיֵּי שָׂרָה')
assetSedraOfDate(new Date(2015, 10, 8), 9, 'תּוֹלְדֹת')
assetSedraOfDate(new Date(2015, 10, 14), 9, 'תּוֹלְדֹת')
assetSedraOfDate(new Date(2015, 10, 15), 10, 'וַיֵּצֵא')
assetSedraOfDate(new Date(2015, 10, 21), 10, 'וַיֵּצֵא')
assetSedraOfDate(new Date(2015, 10, 22), 11, 'וַיִּשְׁלַח')
assetSedraOfDate(new Date(2015, 10, 28), 11, 'וַיִּשְׁלַח')
assetSedraOfDate(new Date(2015, 10, 29), 12, 'וַיֵּשֶׁב')
assetSedraOfDate(new Date(2015, 11, 5), 12, 'וַיֵּשֶׁב')
assetSedraOfDate(new Date(2015, 11, 6), 13, 'מִקֵּץ')
assetSedraOfDate(new Date(2015, 11, 12), 13, 'מִקֵּץ')
assetSedraOfDate(new Date(2015, 11, 13), 14, 'וַיִּגַּשׁ')
assetSedraOfDate(new Date(2015, 11, 19), 14, 'וַיִּגַּשׁ')
assetSedraOfDate(new Date(2015, 11, 20), 15, 'וַיְחִי')
assetSedraOfDate(new Date(2015, 11, 26), 15, 'וַיְחִי')
assetSedraOfDate(new Date(2015, 11, 27), 16, 'שְׁמוֹת')
assetSedraOfDate(new Date(2016, 0, 2), 16, 'שְׁמוֹת')
assetSedraOfDate(new Date(2016, 0, 3), 17, 'וָאֵרָא')
assetSedraOfDate(new Date(2016, 0, 9), 17, 'וָאֵרָא')
assetSedraOfDate(new Date(2016, 0, 10), 18, 'בֹּא')
assetSedraOfDate(new Date(2016, 0, 16), 18, 'בֹּא')
assetSedraOfDate(new Date(2016, 0, 17), 19, 'בְּשַׁלַּח')
assetSedraOfDate(new Date(2016, 0, 23), 19, 'בְּשַׁלַּח')
assetSedraOfDate(new Date(2016, 0, 24), 20, 'יִתְרוֹ')
assetSedraOfDate(new Date(2016, 0, 30), 20, 'יִתְרוֹ')
assetSedraOfDate(new Date(2016, 0, 31), 21, 'מִּשְׁפָּטִים')
assetSedraOfDate(new Date(2016, 1, 6), 21, 'מִּשְׁפָּטִים')
assetSedraOfDate(new Date(2016, 1, 7), 22, 'תְּרוּמָה')
assetSedraOfDate(new Date(2016, 1, 13), 22, 'תְּרוּמָה')
assetSedraOfDate(new Date(2016, 1, 14), 23, 'תְּצַוֶּה')
assetSedraOfDate(new Date(2016, 1, 20), 23, 'תְּצַוֶּה')
assetSedraOfDate(new Date(2016, 1, 21), 24, 'כִּי תִשָּׂא')
assetSedraOfDate(new Date(2016, 1, 27), 24, 'כִּי תִשָּׂא')
assetSedraOfDate(new Date(2016, 1, 28), 25, 'וַיַּקְהֵל')
assetSedraOfDate(new Date(2016, 2, 5), 25, 'וַיַּקְהֵל')
assetSedraOfDate(new Date(2016, 2, 6), 26, 'פְקוּדֵי')
assetSedraOfDate(new Date(2016, 2, 12), 26, 'פְקוּדֵי')
assetSedraOfDate(new Date(2016, 2, 13), 27, 'וַיִּקְרָא')
assetSedraOfDate(new Date(2016, 2, 19), 27, 'וַיִּקְרָא')
assetSedraOfDate(new Date(2016, 2, 20), 28, 'צַו')
assetSedraOfDate(new Date(2016, 2, 26), 28, 'צַו')
assetSedraOfDate(new Date(2016, 2, 27), 29, 'שְּׁמִינִי')
assetSedraOfDate(new Date(2016, 3, 2), 29, 'שְּׁמִינִי')
assetSedraOfDate(new Date(2016, 3, 3), 30, 'תַזְרִיעַ')
assetSedraOfDate(new Date(2016, 3, 9), 30, 'תַזְרִיעַ')
assetSedraOfDate(new Date(2016, 3, 10), 31, 'מְּצֹרָע')
assetSedraOfDate(new Date(2016, 3, 16), 31, 'מְּצֹרָע')
assetSedraOfDate(new Date(2016, 3, 17), 32, 'חַג הַפֶּסַח')
assetSedraOfDate(new Date(2016, 3, 23), 32, 'חַג הַפֶּסַח')
assetSedraOfDate(new Date(2016, 3, 24), 33, 'אַחֲרוֹן שֶׁל פֶּסַח')
assetSedraOfDate(new Date(2016, 3, 30), 33, 'אַחֲרוֹן שֶׁל פֶּסַח')
assetSedraOfDate(new Date(2016, 4, 1), 34, 'אַחֲרֵי מוֹת')
assetSedraOfDate(new Date(2016, 4, 7), 34, 'אַחֲרֵי מוֹת')
assetSedraOfDate(new Date(2016, 4, 8), 35, 'קְדֹשִׁים')
assetSedraOfDate(new Date(2016, 4, 14), 35, 'קְדֹשִׁים')
assetSedraOfDate(new Date(2016, 4, 15), 36, 'אֱמֹר')
assetSedraOfDate(new Date(2016, 4, 21), 36, 'אֱמֹר')
assetSedraOfDate(new Date(2016, 4, 22), 37, 'בְּהַר סִינַי')
assetSedraOfDate(new Date(2016, 4, 28), 37, 'בְּהַר סִינַי')
assetSedraOfDate(new Date(2016, 4, 29), 38, 'בְּחֻקֹּתַי')
assetSedraOfDate(new Date(2016, 5, 4), 38, 'בְּחֻקֹּתַי')
assetSedraOfDate(new Date(2016, 5, 5), 39, 'בְּמִדְבַּר סִינַי')
assetSedraOfDate(new Date(2016, 5, 11), 39, 'בְּמִדְבַּר סִינַי')
assetSedraOfDate(new Date(2016, 5, 12), 40, 'נָשֹׂא')
assetSedraOfDate(new Date(2016, 5, 18), 40, 'נָשֹׂא')
assetSedraOfDate(new Date(2016, 5, 19), 41, 'בְּהַעֲלֹתְךָ')
assetSedraOfDate(new Date(2016, 5, 25), 41, 'בְּהַעֲלֹתְךָ')
assetSedraOfDate(new Date(2016, 5, 26), 42, 'שְׁלַח')
assetSedraOfDate(new Date(2016, 6, 2), 42, 'שְׁלַח')
assetSedraOfDate(new Date(2016, 6, 3), 43, 'קֹרַח')
assetSedraOfDate(new Date(2016, 6, 9), 43, 'קֹרַח')
assetSedraOfDate(new Date(2016, 6, 10), 44, 'חֻקַּת')
assetSedraOfDate(new Date(2016, 6, 16), 44, 'חֻקַּת')
assetSedraOfDate(new Date(2016, 6, 17), 45, 'בָּלָק')
assetSedraOfDate(new Date(2016, 6, 23), 45, 'בָּלָק')
assetSedraOfDate(new Date(2016, 6, 24), 46, 'פִּינְחָס')
assetSedraOfDate(new Date(2016, 6, 30), 46, 'פִּינְחָס')
assetSedraOfDate(new Date(2016, 6, 31), 47, 'מַּטּוֹת-מַסְעֵי')
assetSedraOfDate(new Date(2016, 7, 6), 47, 'מַּטּוֹת-מַסְעֵי')
assetSedraOfDate(new Date(2016, 7, 7), 48, 'דְּבָרִים')
assetSedraOfDate(new Date(2016, 7, 13), 48, 'דְּבָרִים')
assetSedraOfDate(new Date(2016, 7, 14), 49, 'וָאֶתְחַנַּן')
assetSedraOfDate(new Date(2016, 7, 20), 49, 'וָאֶתְחַנַּן')
assetSedraOfDate(new Date(2016, 7, 21), 50, 'עֵקֶב')
assetSedraOfDate(new Date(2016, 7, 27), 50, 'עֵקֶב')
assetSedraOfDate(new Date(2016, 7, 28), 51, 'רְאֵה')
assetSedraOfDate(new Date(2016, 8, 3), 51, 'רְאֵה')
assetSedraOfDate(new Date(2016, 8, 4), 52, 'שֹׁפְטִים')
assetSedraOfDate(new Date(2016, 8, 10), 52, 'שֹׁפְטִים')
assetSedraOfDate(new Date(2016, 8, 11), 53, 'כִּי-תֵצֵא')
assetSedraOfDate(new Date(2016, 8, 17), 53, 'כִּי-תֵצֵא')
assetSedraOfDate(new Date(2016, 8, 18), 54, 'כִּי-תָבוֹא')
assetSedraOfDate(new Date(2016, 8, 24), 54, 'כִּי-תָבוֹא')
assetSedraOfDate(new Date(2016, 8, 25), 55, 'נִצָּבִים')
assetSedraOfDate(new Date(2016, 9, 1), 55, 'נִצָּבִים')
assetSedraOfDate(new Date(2016, 9, 2), 56, 'וַיֵּלֶךְ')

# 5777 -- M3
assetSedraOfDate(new Date(2016, 9, 3), 1, 'וַיֵּלֶךְ')
assetSedraOfDate(new Date(2016, 9, 8), 1, 'וַיֵּלֶךְ')
assetSedraOfDate(new Date(2016, 9, 9), 2, 'הַאֲזִינוּ')
assetSedraOfDate(new Date(2016, 9, 15), 2, 'הַאֲזִינוּ')
assetSedraOfDate(new Date(2016, 9, 16), 3, 'חַג הַסֻּכּוֹת')
assetSedraOfDate(new Date(2016, 9, 22), 3, 'חַג הַסֻּכּוֹת')
assetSedraOfDate(new Date(2016, 9, 23), 4, 'בְּרֵאשִׁית')
assetSedraOfDate(new Date(2016, 9, 29), 4, 'בְּרֵאשִׁית')
assetSedraOfDate(new Date(2016, 9, 30), 5, 'נֹחַ')
assetSedraOfDate(new Date(2016, 10, 5), 5, 'נֹחַ')
assetSedraOfDate(new Date(2016, 10, 6), 6, 'לֶךְ-לְךָ')
assetSedraOfDate(new Date(2016, 10, 12), 6, 'לֶךְ-לְךָ')
assetSedraOfDate(new Date(2016, 10, 13), 7, 'וַיֵּרָא')
assetSedraOfDate(new Date(2016, 10, 19), 7, 'וַיֵּרָא')
assetSedraOfDate(new Date(2016, 10, 20), 8, 'חַיֵּי שָׂרָה')
assetSedraOfDate(new Date(2016, 10, 26), 8, 'חַיֵּי שָׂרָה')
assetSedraOfDate(new Date(2016, 10, 27), 9, 'תּוֹלְדֹת')
assetSedraOfDate(new Date(2016, 11, 3), 9, 'תּוֹלְדֹת')
assetSedraOfDate(new Date(2016, 11, 4), 10, 'וַיֵּצֵא')
assetSedraOfDate(new Date(2016, 11, 10), 10, 'וַיֵּצֵא')
assetSedraOfDate(new Date(2016, 11, 11), 11, 'וַיִּשְׁלַח')
assetSedraOfDate(new Date(2016, 11, 17), 11, 'וַיִּשְׁלַח')
assetSedraOfDate(new Date(2016, 11, 18), 12, 'וַיֵּשֶׁב')
assetSedraOfDate(new Date(2016, 11, 24), 12, 'וַיֵּשֶׁב')
assetSedraOfDate(new Date(2016, 11, 25), 13, 'מִקֵּץ')
assetSedraOfDate(new Date(2016, 11, 31), 13, 'מִקֵּץ')
assetSedraOfDate(new Date(2017, 0, 1), 14, 'וַיִּגַּשׁ')
assetSedraOfDate(new Date(2017, 0, 7), 14, 'וַיִּגַּשׁ')
assetSedraOfDate(new Date(2017, 0, 8), 15, 'וַיְחִי')
assetSedraOfDate(new Date(2017, 0, 14), 15, 'וַיְחִי')
assetSedraOfDate(new Date(2017, 0, 15), 16, 'שְׁמוֹת')
assetSedraOfDate(new Date(2017, 0, 21), 16, 'שְׁמוֹת')
assetSedraOfDate(new Date(2017, 0, 22), 17, 'וָאֵרָא')
assetSedraOfDate(new Date(2017, 0, 28), 17, 'וָאֵרָא')
assetSedraOfDate(new Date(2017, 0, 29), 18, 'בֹּא')
assetSedraOfDate(new Date(2017, 1, 4), 18, 'בֹּא')
assetSedraOfDate(new Date(2017, 1, 10), 19, 'בְּשַׁלַּח')
assetSedraOfDate(new Date(2017, 1, 11), 19, 'בְּשַׁלַּח')
assetSedraOfDate(new Date(2017, 1, 17), 20, 'יִתְרוֹ')
assetSedraOfDate(new Date(2017, 1, 18), 20, 'יִתְרוֹ')
assetSedraOfDate(new Date(2017, 1, 24), 21, 'מִּשְׁפָּטִים')
assetSedraOfDate(new Date(2017, 1, 25), 21, 'מִּשְׁפָּטִים')
assetSedraOfDate(new Date(2017, 1, 26), 22, 'תְּרוּמָה')
assetSedraOfDate(new Date(2017, 2, 4), 22, 'תְּרוּמָה')
assetSedraOfDate(new Date(2017, 2, 5), 23, 'תְּצַוֶּה')
assetSedraOfDate(new Date(2017, 2, 11), 23, 'תְּצַוֶּה')
assetSedraOfDate(new Date(2017, 2, 12), 24, 'כִּי תִשָּׂא')
assetSedraOfDate(new Date(2017, 2, 18), 24, 'כִּי תִשָּׂא')
assetSedraOfDate(new Date(2017, 2, 19), 25, 'וַיַּקְהֵל-פְקוּדֵי')
assetSedraOfDate(new Date(2017, 2, 25), 25, 'וַיַּקְהֵל-פְקוּדֵי')
assetSedraOfDate(new Date(2017, 2, 26), 26, 'וַיִּקְרָא')
assetSedraOfDate(new Date(2017, 3, 1), 26, 'וַיִּקְרָא')
assetSedraOfDate(new Date(2017, 3, 2), 27, 'צַו')
assetSedraOfDate(new Date(2017, 3, 8), 27, 'צַו')
assetSedraOfDate(new Date(2017, 3, 9), 28, 'חַג הַפֶּסַח')
assetSedraOfDate(new Date(2017, 3, 15), 28, 'חַג הַפֶּסַח')
assetSedraOfDate(new Date(2017, 3, 16), 29, 'שְּׁמִינִי')
assetSedraOfDate(new Date(2017, 3, 22), 29, 'שְּׁמִינִי')
assetSedraOfDate(new Date(2017, 3, 23), 30, 'תַזְרִיעַ-מְּצֹרָע')
assetSedraOfDate(new Date(2017, 3, 29), 30, 'תַזְרִיעַ-מְּצֹרָע')
assetSedraOfDate(new Date(2017, 3, 30), 31, 'אַחֲרֵי מוֹת-קְדֹשִׁים')
assetSedraOfDate(new Date(2017, 4, 6), 31, 'אַחֲרֵי מוֹת-קְדֹשִׁים')
assetSedraOfDate(new Date(2017, 4, 7), 32, 'אֱמֹר')
assetSedraOfDate(new Date(2017, 4, 13), 32, 'אֱמֹר')
assetSedraOfDate(new Date(2017, 4, 14), 33, 'בְּהַר סִינַי-בְּחֻקֹּתַי')
assetSedraOfDate(new Date(2017, 4, 20), 33, 'בְּהַר סִינַי-בְּחֻקֹּתַי')
assetSedraOfDate(new Date(2017, 4, 21), 34, 'בְּמִדְבַּר סִינַי')
assetSedraOfDate(new Date(2017, 4, 27), 34, 'בְּמִדְבַּר סִינַי')
assetSedraOfDate(new Date(2017, 4, 28), 35, 'נָשֹׂא')
assetSedraOfDate(new Date(2017, 5, 3), 35, 'נָשֹׂא')
assetSedraOfDate(new Date(2017, 5, 4), 36, 'בְּהַעֲלֹתְךָ')
assetSedraOfDate(new Date(2017, 5, 10), 36, 'בְּהַעֲלֹתְךָ')
assetSedraOfDate(new Date(2017, 5, 11), 37, 'שְׁלַח')
assetSedraOfDate(new Date(2017, 5, 17), 37, 'שְׁלַח')
assetSedraOfDate(new Date(2017, 5, 18), 38, 'קֹרַח')
assetSedraOfDate(new Date(2017, 5, 24), 38, 'קֹרַח')
assetSedraOfDate(new Date(2017, 5, 25), 39, 'חֻקַּת')
assetSedraOfDate(new Date(2017, 6, 1), 39, 'חֻקַּת')
assetSedraOfDate(new Date(2017, 6, 2), 40, 'בָּלָק')
assetSedraOfDate(new Date(2017, 6, 8), 40, 'בָּלָק')
assetSedraOfDate(new Date(2017, 6, 9), 41, 'פִּינְחָס')
assetSedraOfDate(new Date(2017, 6, 15), 41, 'פִּינְחָס')
assetSedraOfDate(new Date(2017, 6, 16), 42, 'מַּטּוֹת-מַסְעֵי')
assetSedraOfDate(new Date(2017, 6, 22), 42, 'מַּטּוֹת-מַסְעֵי')
assetSedraOfDate(new Date(2017, 6, 23), 43, 'דְּבָרִים')
assetSedraOfDate(new Date(2017, 6, 29), 43, 'דְּבָרִים')
assetSedraOfDate(new Date(2017, 6, 30), 44, 'וָאֶתְחַנַּן')
assetSedraOfDate(new Date(2017, 7, 5), 44, 'וָאֶתְחַנַּן')
assetSedraOfDate(new Date(2017, 7, 6), 45, 'עֵקֶב')
assetSedraOfDate(new Date(2017, 7, 12), 45, 'עֵקֶב')
assetSedraOfDate(new Date(2017, 7, 13), 46, 'רְאֵה')
assetSedraOfDate(new Date(2017, 7, 19), 46, 'רְאֵה')
assetSedraOfDate(new Date(2017, 7, 20), 47, 'שֹׁפְטִים')
assetSedraOfDate(new Date(2017, 7, 26), 47, 'שֹׁפְטִים')
assetSedraOfDate(new Date(2017, 7, 27), 48, 'כִּי-תֵצֵא')
assetSedraOfDate(new Date(2017, 8, 2), 48, 'כִּי-תֵצֵא')
assetSedraOfDate(new Date(2017, 8, 3), 49, 'כִּי-תָבוֹא')
assetSedraOfDate(new Date(2017, 8, 9), 49, 'כִּי-תָבוֹא')
assetSedraOfDate(new Date(2017, 8, 10), 50, 'נִצָּבִים-וַיֵּלֶךְ')
assetSedraOfDate(new Date(2017, 8, 16), 50, 'נִצָּבִים-וַיֵּלֶךְ')
assetSedraOfDate(new Date(2017, 8, 17), 51, 'הַאֲזִינוּ')
assetSedraOfDate(new Date(2017, 8, 20), 51, 'הַאֲזִינוּ')

# 5778 -- R4
assetSedraOfDate(new Date(2017, 8, 21), 1, 'הַאֲזִינוּ')
assetSedraOfDate(new Date(2017, 8, 23), 1, 'הַאֲזִינוּ')

# 5780 -- M5
# 5781 -- S5
# 5782 -- T1
# 5784 -- S2
# 5785 -- R5
# 5786 -- T4

# assertSedrotOfYear = (year) ->
#   QUnit.test "Sedrot of year #{year}", (assert) ->
#     actual = hebrew_year_of(year).sedrot().sedrot
#     console.log actual
#     assert.ok true
#
# assertSedrotOfYear(5775)