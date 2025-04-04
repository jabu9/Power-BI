let
    // Define the start and end dates
    StartDate = #date(2020, 1, 1),
    EndDate = #date(2030, 12, 31),
    
    // Generate a list of dates between the start and end dates
    DateList = List.Dates(StartDate, Duration.Days(EndDate - StartDate) + 1, #duration(1, 0, 0, 0)),
    
    // Convert the list of dates to a table
    DateTable = Table.FromList(DateList, Splitter.SplitByNothing(), {"Date"}),
    
    // Add columns for Year, Quarter, Month, and Day
    AddYear = Table.AddColumn(DateTable, "Year", each Date.Year([Date])),
    AddQuarter = Table.AddColumn(AddYear, "Quarter", each Date.QuarterOfYear([Date])),
    AddMonth = Table.AddColumn(AddQuarter, "Month", each Date.Month([Date])),
    AddMonthName = Table.AddColumn(AddMonth, "MonthName", each Date.MonthName([Date])),
    AddDay = Table.AddColumn(AddMonthName, "Day", each Date.Day([Date])),
    
    // Add columns for Week of Year and Weekday
    AddWeekOfYear = Table.AddColumn(AddDay, "WeekOfYear", each Date.WeekOfYear([Date])),
    AddWeekday = Table.AddColumn(AddWeekOfYear, "Weekday", each Date.DayOfWeek([Date], Day.Sunday)),
    
    // Define federal holidays and corresponding names
    FederalHolidays = {
        #date(2020, 1, 1), 
        #date(2020, 1, 20), 
        #date(2020, 2, 17), 
        #date(2020, 5, 25), 
        #date(2020, 7, 4), 
        #date(2020, 9, 7), 
        #date(2020, 10, 12), 
        #date(2020, 11, 11), 
        #date(2020, 11, 26), 
        #date(2020, 12, 25)
    },
    HolidayNames = {
        "New Year's Day", 
        "Martin Luther King Jr. Day", 
        "Presidents' Day", 
        "Memorial Day", 
        "Independence Day", 
        "Labor Day", 
        "Columbus Day", 
        "Veterans Day", 
        "Thanksgiving Day", 
        "Christmas Day"
    },
    
    // Add a column to identify federal holidays
    AddFederalHoliday = Table.AddColumn(AddWeekday, "FederalHoliday", each try List.PositionOf(FederalHolidays, [Date]) otherwise null),
    AddHolidayName = Table.AddColumn(AddFederalHoliday, "HolidayName", each if [FederalHoliday] <> null and [FederalHoliday] >= 0 then HolidayNames{[FederalHoliday]} else null),
    
    // Add a column for the federal fiscal year
    AddFiscalYear = Table.AddColumn(AddHolidayName, "FiscalYear", each if Date.Month([Date]) >= 10 then Date.Year([Date]) + 1 else Date.Year([Date])),
    
    // Remove the intermediate FederalHoliday column
    RemoveIntermediateColumn = Table.RemoveColumns(AddFiscalYear, {"FederalHoliday"}),
    
    // Rename columns
    RenameColumns = Table.RenameColumns(RemoveIntermediateColumn, {{"Date", "Date"}, {"Year", "Year"}, {"Quarter", "Quarter"}, {"Month", "Month"}, {"MonthName", "MonthName"}, {"Day", "Day"}, {"WeekOfYear", "WeekOfYear"}, {"Weekday", "Weekday"}, {"HolidayName", "FederalHoliday"}, {"FiscalYear", "FiscalYear"}}),
    #"Changed Type" = Table.TransformColumnTypes(RenameColumns,{{"Date", type date}, {"MonthName", type text}, {"Year", Int64.Type}, {"Quarter", Int64.Type}, {"Month", Int64.Type}, {"Day", Int64.Type}, {"WeekOfYear", Int64.Type}, {"Weekday", Int64.Type}, {"FederalHoliday", type text}, {"FiscalYear", Int64.Type}})
in
    #"Changed Type"