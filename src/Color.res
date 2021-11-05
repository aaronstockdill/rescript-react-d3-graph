type t = string // Needed for compatibility

// Much more flexible
type canon = {
  red: float,
  green: float,
  blue: float,
}

exception DOMAIN_ERROR

let isZeroToOne = f => f >= 0.0 && f <= 1.0

let isZeroTo255 = i => i >= 0 && i <= 255
let intToFloat = i => Belt.Int.toFloat(i) /. 255.0
let floatToInt = f => Belt.Int.fromFloat(f *. 255.0)

let isHexString = s => %re("/^#(([0-9a-f])|([0-9A-F])){6}$/")->Js.Re.test_(s)
let sliceHexString = s => {
  let r = Js.String2.slice(s, ~from=1, ~to_=3)
  let g = Js.String2.slice(s, ~from=3, ~to_=5)
  let b = Js.String2.slice(s, ~from=5, ~to_=7)
  (r, g, b)
}
let hexToFloat = h => Js.Float.fromString(Js.String2.concat("0x", h)) /. 255.0
let floatToHex = f => floatToInt(f)->Js.Int.toStringWithRadix(~radix=16)

let canonOfInternal = s =>
  if isHexString(s) {
    let (red, green, blue) = sliceHexString(s)
    {
      red: red->hexToFloat,
      green: green->hexToFloat,
      blue: blue->hexToFloat,
    }
  } else {
    raise(DOMAIN_ERROR)
  }
let internalOfCanon = t =>
  Js.String2.concatMany("#", [t.red->floatToHex, t.green->floatToHex, t.blue->floatToHex])

// Hex is our "internal" format, conveniently
let ofHexString = s => canonOfInternal(s)->internalOfCanon
let toHexString = t => t

let ofRGB_f = (r, g, b) =>
  if isZeroToOne(r) && isZeroToOne(g) && isZeroToOne(b) {
    {
      red: r,
      green: g,
      blue: b,
    }->internalOfCanon
  } else {
    raise(DOMAIN_ERROR)
  }
let toRGB_f = t => {
  let t = t->canonOfInternal
  (t.red, t.green, t.blue)
}

let ofRGB_u8 = (r, g, b) =>
  if isZeroTo255(r) && isZeroTo255(g) && isZeroTo255(b) {
    {
      red: intToFloat(r),
      green: intToFloat(g),
      blue: intToFloat(b),
    }->internalOfCanon
  } else {
    raise(DOMAIN_ERROR)
  }
let toRGB_u8 = t => {
  let t = t->canonOfInternal
  let r = t.red->floatToInt
  let g = t.green->floatToInt
  let b = t.blue->floatToInt
  (r, g, b)
}
