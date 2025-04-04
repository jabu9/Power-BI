let
    Currencies = {
        {"USD", "United States Dollar", "North America"},
        {"EUR", "Euro", "Europe"},
        {"GBP", "British Pound", "Europe"},
        {"JPY", "Japanese Yen", "Asia"},
        {"INR", "Indian Rupee", "Asia"},
        {"AUD", "Australian Dollar", "Oceania"},
        {"CAD", "Canadian Dollar", "North America"},
        // Add more as needed...
        {"ZAR", "South African Rand", "Africa"}
    },
    
    CurrencyTable = Table.FromRows(
        Currencies,
        {"Currency Code", "Currency Name", "Primary Continent"}
    ),
    
    TypedTable = Table.TransformColumnTypes(
        CurrencyTable,
        {
            {"Currency Code", type text},
            {"Currency Name", type text},
            {"Primary Continent", type text}
        }
    )
in
    TypedTable