let
    TimeZones = {
        {"UTC", "Coordinated Universal Time", 0},
        {"EST", "Eastern Standard Time", -5},
        {"PST", "Pacific Standard Time", -8},
        {"CET", "Central European Time", 1},
        {"IST", "India Standard Time", 5.5},
        {"AEST", "Australian Eastern Standard Time", 10},
        // Add more as needed...
        {"JST", "Japan Standard Time", 9}
    },
    
    TimeZoneTable = Table.FromRows(
        TimeZones,
        {"Time Zone", "Description", "UTC Offset"}
    ),
    
    TypedTable = Table.TransformColumnTypes(
        TimeZoneTable,
        {
            {"Time Zone", type text},
            {"Description", type text},
            {"UTC Offset", type number}
        }
    )
in
    TypedTable