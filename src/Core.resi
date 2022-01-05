let readKey: ('a, string) => option<'b>
let readKeyExn: ('a, string) => 'b
let setKey: ('a, string, 'b) => 'c
let dropUndefinedKeys: 'a => 'a
let pack: ('a, 'b) => 'c
