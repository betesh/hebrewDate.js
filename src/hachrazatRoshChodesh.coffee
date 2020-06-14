weekdays = if moment? then moment.weekdays else ((i)-> ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'][i])

class HachrazatRoshChodesh
  constructor: (hebrew_date) ->
    hebrewYear = hebrew_date.getHebrewYear()
    months = HebrewMonth.MONTHS.ofYear(hebrewYear)
    monthIndex = (months.indexOf(hebrew_date.staticHebrewMonth) + 1) % months.length
    @name = months[monthIndex].name
    molad = hebrewYear.getThisRoshHashana().getMolad().advance(monthIndex)
    moladHours = molad.getHours() - 6
    yesterday = moladHours < 0
    pm = yesterday || moladHours >= 12
    moladHours = (moladHours + 12) % 12
    moladHours = 12 if 0 == moladHours
    moladMinutes = "0#{parseInt(molad.getHalakim() / 18)}"[-2..-1]
    @moladHalakim = molad.getHalakim() % 18
    @dayOfMolad = switch
      when 0 == molad.getDay() && yesterday then "מוֹצָאֵי שַּׁבָּת"
      when 6 == molad.getDay() then "#{if yesterday then "לֵיל " else ""}שַּׁבָּת"
      else "#{weekdays(molad.getDay() - (if yesterday then 1 else 0))}#{if yesterday then " night" else ""}"
    is2Days = 30 == hebrew_date.getHebrewMonth().getLength()
    @moladTime = "#{moladHours}:#{moladMinutes}#{if pm then "P" else "A"}M"
    dayOfWeek1Index = hebrew_date.getHebrewMonth().getNextRoshHodesh().getDay()
    dayOfWeek1 = HEBREW_DAYS[dayOfWeek1Index]
    dayOfWeek30 = HEBREW_DAYS[(dayOfWeek1Index + 6) % 7]
    @fullDayOfWeekPhrase = "בְּיוֹם #{if is2Days then "#{dayOfWeek30} וּבְיוֹם " else ""}#{dayOfWeek1}"
    moladIsWeekBeforeRoshHodesh = dayOfWeek1Index < molad.getDay() && dayOfWeek1Index >= (if is2Days then 1 else 0)
    hachrazahIsSameDayAsMolad = "שַּׁבָּת" == @dayOfMolad && moladIsWeekBeforeRoshHodesh
    @verb = switch
      when hachrazahIsSameDayAsMolad then "is [today]"
      when moladIsWeekBeforeRoshHodesh then "was on"
      else "will be on"
  sephardicAnnouncement: -> "בְּסִימַן טוֹב יְהֵא לָנוּ רֹאשׁ חֹדֶשׁ #{@name} #{@fullDayOfWeekPhrase}"
  ashkenazicAnnouncement: -> "רֹאשׁ חֹדֶשׁ #{@name} יִהְיֶה #{@fullDayOfWeekPhrase} הַבָּא עָלֵינוּ וְעַל כָּל-יִשְׂרָאֵל לְטוֹבָה"
  moladAnnouncement: -> "The מוֹלַד of חֹדֶשׁ #{@name} #{@verb} #{@dayOfMolad} at #{@moladTime} and #{@moladHalakim} #{if 1 == @moladHalakim then "חֵלֶק" else "חָלָקִים"}"

(exports ? this).HEBREW_DAYS = ['רִאשׁוֹן', 'שֵׁנִי', 'שְׁלִישִׁי', 'רְבִיעִי', 'חֲמִישִׁי', 'הַשִּׁשִּׁי', 'שַּׁבָּת קֹדֶשׁ']
(exports ? this).HachrazatRoshChodesh = HachrazatRoshChodesh
