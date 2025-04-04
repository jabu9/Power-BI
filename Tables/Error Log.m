let
    ErrorLog = (ErrorMessage as text, StepName as text) as table =>
        let
            LogEntry = Table.FromRecords({[DateTime = DateTime.LocalNow(), Step = StepName, Error = ErrorMessage]}),
            TypedTable = Table.TransformColumnTypes(LogEntry, {{"DateTime", type datetime}, {"Step", type text}, {"Error", type text}})
        in
            TypedTable,
    
    // Example usage
    SampleLog = ErrorLog("Missing data in column X", "Data Validation")
in
    SampleLog