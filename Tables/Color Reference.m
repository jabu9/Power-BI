let
    Colors = {
        {"Red", "#FF0000", 255, 0, 0},
        {"Green", "#00FF00", 0, 255, 0},
        {"Blue", "#0000FF", 0, 0, 255},
        {"Yellow", "#FFFF00", 255, 255, 0},
        {"Purple", "#800080", 128, 0, 128},
        {"Orange", "#FFA500", 255, 165, 0},
        {"Black", "#000000", 0, 0, 0},
        {"White", "#FFFFFF", 255, 255, 255},
        {"Gray", "#808080", 128, 128, 128}
        // Add more colors as needed...
    },
    
    ColorTable = Table.FromRows(
        Colors,
        {"Color Name", "HEX Code", "R", "G", "B"}
    ),
    
    TypedTable = Table.TransformColumnTypes(
        ColorTable,
        {
            {"Color Name", type text},
            {"HEX Code", type text},
            {"R", Int64.Type},
            {"G", Int64.Type},
            {"B", Int64.Type}
        }
    )
in
    TypedTable