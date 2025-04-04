let
    Conversions = {
        {"Length", "Meters", "Feet", 3.28084},
        {"Length", "Meters", "Inches", 39.3701},
        {"Length", "Kilometers", "Miles", 0.621371},
        {"Weight", "Kilograms", "Pounds", 2.20462},
        {"Weight", "Grams", "Ounces", 0.035274},
        {"Volume", "Liters", "Gallons", 0.264172},
        {"Volume", "Liters", "Pints", 2.11338}
        // Add more conversions as needed...
    },
    
    ConversionTable = Table.FromRows(
        Conversions,
        {"Category", "From Unit", "To Unit", "Conversion Factor"}
    ),
    
    TypedTable = Table.TransformColumnTypes(
        ConversionTable,
        {
            {"Category", type text},
            {"From Unit", type text},
            {"To Unit", type text},
            {"Conversion Factor", type number}
        }
    )
in
    TypedTable