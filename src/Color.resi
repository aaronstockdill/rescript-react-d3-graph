type t

let ofRGB_u8: (int, int, int) => t
let toRGB_u8: t => (int, int, int)

let ofRGB_f: (float, float, float) => t
let toRGB_f: t => (float, float, float)

let ofHexString: string => t
let toHexString: t => string
