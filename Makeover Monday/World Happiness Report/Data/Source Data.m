let
    // Source: Local Excel File
    Source = Excel.Workbook(File.Contents("C:\\Users\\Jordan\\Documents\\Source Data.xlsx"), null, true),

    // Assuming the data is in the first table or sheet; adjust "Sheet1" or "Table1" as needed
    SheetOrTable = Source{[Item="Sheet1", Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(SheetOrTable, [PromoteAllScalars=true]) // Replace "Sheet1" with your actual sheet name or table name

    // Promote headers if needed (uncomment if the first row isn’t already headers)
    // #"Promoted Headers" = Table.PromoteHeaders(SheetOrTable, [PromoteAllScalars=true]),

in
    #"Promoted Headers"