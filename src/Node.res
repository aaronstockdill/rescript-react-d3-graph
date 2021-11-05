module LabelPosition = {
  type t = string
  let left = "left"
  let right = "right"
  let top = "top"
  let bottom = "bottom"
  let center = "center"
}

module SymbolType = {
  type t = string
  let circle = "circle"
  let cross = "cross"
  let diamond = "diamond"
  let square = "square"
  let star = "star"
  let triangle = "triangle"
  let wye = "wye"
}

module Id = {
  type t = string
  let ofString = t => t
  let toString = t => t
}

type rec t<'payload> = {
  id: Id.t,
  payload: option<'payload>,
  config: option<config<'payload>>
}
and config<'payload> = {
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

module Config = {
  type t<'payload> = config<'payload> = {
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

let create = (
  ~id,
  ~payload=?,
  ~config=?,
  _
) => {
  {
    id: id,
    payload: payload,
    config: None,
  }->Core.pack(config)->Core.dropUndefinedKeys
}
