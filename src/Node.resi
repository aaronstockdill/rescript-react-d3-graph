type t<'payload>

module Id : {
  type t
  let ofString: string => t
  let toString: t => string
}

module LabelPosition : {
  type t
  let left: t
  let right: t
  let top: t
  let bottom: t
  let center: t
}

module SymbolType : {
  type t
  let circle: t
  let cross: t
  let diamond: t
  let square: t
  let star: t
  let triangle: t
  let wye: t
}

module Config : {
  type t<'payload> = {
    color: option<Color.t>,
    fontColor: option<Color.t>,
    fontSize: option<float>,
    fontWeight: option<string>,
    highlightColor: option<Color.t>,
    highlightFontSize: option<float>,
    highlightFontWeight: option<string>,
    highlightStrokeColor: option<Color.t>,
    highlightStrokeWidth: option<float>,
    labelPosition: option<LabelPosition.t>,
    labelProperty: option<(t<'payload> => string)>,
    mouseCursor: option<MouseCursor.t>,
    opacity: option<float>,
    renderLabel: option<bool>,
    size: option<{"width": float, "height": float}>,
    strokeColor: option<Color.t>,
    strokeWidth: option<float>,
    svg:option<string>,
    symbolType: option<SymbolType.t>,
    viewGenerator: option<(t<'payload> => React.element)>,
  }
}

let create:(
  ~id:Id.t,
  ~payload:'payload=?,
  ~config:Config.t<'payload>=?,
  unit
) => t<'payload>
