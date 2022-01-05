@module("./CoreHelper")
external readKeyExn: ('a, string) => 'val = "readKey"

@module("./CoreHelper")
external readKey: ('a, string) => option<'val> = "readKey"

@module("./CoreHelper")
external dropUndefinedKeys: 'a => 'a = "dropUndefinedKeys"

@module("./CoreHelper")
external setKey: ('a, string, 'b) => 'c = "setKey"

@module("./CoreHelper")
external pack: ('a, 'b) => 'c = "pack"
