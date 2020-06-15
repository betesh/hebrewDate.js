class Sedra
  constructor: (hebrewYear) ->
    yearBeginsOn = hebrewYear.getThisRoshHashana().getGregorianDate().getDay()
    yearEndsOn = hebrewYear.getNextRoshHashana().getGregorianDate().getDay()
    isLeapYear = hebrewYear.isLeapYear()
    @sedrot = (if isLeapYear then Sedra.SEDROT else Sedra.PESHUTA_SEDROT).slice(0)
    @sedrot.splice(@sedrot.indexOf('וַיַּקְהֵל'), 2, 'וַיַּקְהֵל-פְקוּדֵי') if !isLeapYear && (4 != yearBeginsOn || 2 != yearEndsOn)
    switch yearBeginsOn
      when 6 then @sedrot.splice(0, 0, '', 'רֹאשׁ הַשָּׁנָה', 'הַאֲזִינוּ','חַג הַסֻּכּוֹת', 'שְּׁמִינִי עֲצֶרֶת')
      when 4 then @sedrot.splice(0, 0, '', 'הַאֲזִינוּ', 'יוֹם הַכִּפֻּרִים', 'חַג הַסֻּכּוֹת')
      else @sedrot.splice(0, 0, '', 'וַיֵּלֶךְ', 'הַאֲזִינוּ', 'חַג הַסֻּכּוֹת')
    switch yearEndsOn
      when 6
        @sedrot.splice(@sedrot.indexOf('חֻקַּת'), 2, 'חֻקַּת-בָּלָק')
        @sedrot.splice(@sedrot.indexOf('נָשֹׂא'), 0, 'חַג הַשָׁבֻעוֹת')
        @sedrot.splice(@sedrot.length - 4, 4, 'נִצָּבִים-וַיֵּלֶךְ', 'רֹאשׁ הַשָּׁנָה')
      when 4
        @sedrot.splice(@sedrot.length - 4, 4, 'נִצָּבִים-וַיֵּלֶךְ', 'הַאֲזִינוּ')
      when 2
        @sedrot.splice(@sedrot.length - 2, 2)
      when 1
        @sedrot.splice(@sedrot.length - 2, 2)
    @sedrot.splice(@sedrot.indexOf('מַּטּוֹת'), 2, 'מַּטּוֹת-מַסְעֵי') if 4 != yearEndsOn || !isLeapYear
    @sedrot.splice(@sedrot.length - 23, 0, 'חַג הַפֶּסַח')
    @sedrot.splice(@sedrot.length - 23, 0, 'אַחֲרוֹן שֶׁל פֶּסַח') if 1 == yearEndsOn
  sedra: (hebrewDate) -> @sedrot[hebrewDate.weekOfYear()]

(->
  @SEDROT = ['בְּרֵאשִׁית', 'נֹחַ', 'לֶךְ-לְךָ', 'וַיֵּרָא', 'חַיֵּי שָׂרָה' ,'תּוֹלְדֹת' ,'וַיֵּצֵא', 'וַיִּשְׁלַח', 'וַיֵּשֶׁב', 'מִקֵּץ', 'וַיִּגַּשׁ', 'וַיְחִי', 'שְׁמוֹת', 'וָאֵרָא', 'בֹּא', 'בְּשַׁלַּח', 'יִתְרוֹ', 'מִּשְׁפָּטִים', 'תְּרוּמָה', 'תְּצַוֶּה', 'כִּי תִשָּׂא', 'וַיַּקְהֵל', 'פְקוּדֵי', 'וַיִּקְרָא', 'צַו', 'שְּׁמִינִי', 'תַזְרִיעַ', 'מְּצֹרָע', 'אַחֲרֵי מוֹת', 'קְדֹשִׁים', 'אֱמֹר', 'בְּהַר סִינַי', 'בְּחֻקֹּתַי', 'בְּמִדְבַּר סִינַי', 'נָשֹׂא' , 'בְּהַעֲלֹתְךָ', 'שְׁלַח', 'קֹרַח', 'חֻקַּת', 'בָּלָק' , 'פִּינְחָס', 'מַּטּוֹת', 'מַסְעֵי' , 'דְּבָרִים', 'וָאֶתְחַנַּן' , 'עֵקֶב', 'רְאֵה', 'שֹׁפְטִים', 'כִּי-תֵצֵא', 'כִּי-תָבוֹא', 'נִצָּבִים', 'וַיֵּלֶךְ' , 'הַאֲזִינוּ', 'וְזֹאת הַבְּרָכָה']
  @PESHUTA_SEDROT = @SEDROT.slice(0)
  @PESHUTA_SEDROT.splice(@PESHUTA_SEDROT.indexOf('תַזְרִיעַ'), 2, 'תַזְרִיעַ-מְּצֹרָע')
  @PESHUTA_SEDROT.splice(@PESHUTA_SEDROT.indexOf('אַחֲרֵי מוֹת'), 2, 'אַחֲרֵי מוֹת-קְדֹשִׁים')
  @PESHUTA_SEDROT.splice(@PESHUTA_SEDROT.indexOf('בְּהַר סִינַי'), 2, 'בְּהַר סִינַי-בְּחֻקֹּתַי')
).call(Sedra)

(exports ? this).Sedra = Sedra
