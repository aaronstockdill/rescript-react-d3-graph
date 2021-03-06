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
  config: option<config<'payload>>,
  x: option<float>,
  y: option<float>,
  selected: bool,
}
and config<'payload> = {
  color: option<Color.t>,
  fontColor: option<Color.t>,
  fontSize: option<float>,
  fontScaling: option<bool>,
  fontWeight: option<string>,
  highlightColor: option<Color.t>,
  highlightFontSize: option<float>,
  highlightFontWeight: option<string>,
  highlightStrokeColor: option<Color.t>,
  highlightStrokeWidth: option<float>,
  labelPosition: option<LabelPosition.t>,
  labelProperty: option<t<'payload> => string>,
  mouseCursor: option<MouseCursor.t>,
  opacity: option<float>,
  renderLabel: option<bool>,
  size: option<{"width": float, "height": float}>,
  strokeColor: option<Color.t>,
  strokeWidth: option<float>,
  svg: option<string>,
  symbolType: option<SymbolType.t>,
  viewGenerator: option<t<'payload> => React.element>,
}

module Config = {
  type node<'payload> = t<'payload>
  type t<'payload> = config<'payload> = {
    color: option<Color.t>,
    fontColor: option<Color.t>,
    fontSize: option<float>,
    fontScaling: option<bool>,
    fontWeight: option<string>,
    highlightColor: option<Color.t>,
    highlightFontSize: option<float>,
    highlightFontWeight: option<string>,
    highlightStrokeColor: option<Color.t>,
    highlightStrokeWidth: option<float>,
    labelPosition: option<LabelPosition.t>,
    labelProperty: option<node<'payload> => string>,
    mouseCursor: option<MouseCursor.t>,
    opacity: option<float>,
    renderLabel: option<bool>,
    size: option<{"width": float, "height": float}>,
    strokeColor: option<Color.t>,
    strokeWidth: option<float>,
    svg: option<string>,
    symbolType: option<SymbolType.t>,
    viewGenerator: option<node<'payload> => React.element>,
  }

  let create = (
    ~color=?,
    ~fontColor=?,
    ~fontSize=?,
    ~fontScaling=?,
    ~fontWeight=?,
    ~highlightColor=?,
    ~highlightFontSize=?,
    ~highlightFontWeight=?,
    ~highlightStrokeColor=?,
    ~highlightStrokeWidth=?,
    ~labelPosition=?,
    ~labelProperty=?,
    ~mouseCursor=?,
    ~opacity=?,
    ~renderLabel=?,
    ~size=?,
    ~strokeColor=?,
    ~strokeWidth=?,
    ~svg=?,
    ~symbolType=?,
    ~viewGenerator=?,
    (),
  ) =>
    {
      color: color,
      fontColor: fontColor,
      fontSize: fontSize,
      fontScaling: fontScaling,
      fontWeight: fontWeight,
      highlightColor: highlightColor,
      highlightFontSize: highlightFontSize,
      highlightFontWeight: highlightFontWeight,
      highlightStrokeColor: highlightStrokeColor,
      highlightStrokeWidth: highlightStrokeWidth,
      labelPosition: labelPosition,
      labelProperty: labelProperty,
      mouseCursor: mouseCursor,
      opacity: opacity,
      renderLabel: renderLabel,
      size: size,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      svg: svg,
      symbolType: symbolType,
      viewGenerator: viewGenerator,
    }->Core.dropUndefinedKeys
}

let create = (~id, ~payload=?, ~config=?, ~x=?, ~y=?, _) => {
  {
    id: id,
    payload: payload,
    x: x,
    y: y,
    selected: false,
    config: None,
  }
  ->Core.pack(config)
  ->Core.dropUndefinedKeys
}

let id = t => Core.readKeyExn(t, "id")
let payload = t => Core.readKey(t, "payload")
let x = t => Core.readKeyExn(t, "x")
let y = t => Core.readKeyExn(t, "y")
let selected = t => Core.readKey(t, "selected")->Belt.Option.getWithDefault(false)
let updatePayload = (t, f) => {
  let p = Core.readKey(t, "payload")
  Core.setKey(t, "payload", f(p))->Core.dropUndefinedKeys
}
let updateConfig = (t: t<'a>, f) => {
  let t' = Core.duplicate(t)
  let cfg: Config.t<'a> = Obj.magic(t')
  let newcfg = f(cfg)
  let t'': t<'a> = Core.pack(t', newcfg)
  t''->Core.dropUndefinedKeys
}
let setId = (t, id) => Core.setKey(t, "id", id)->Core.dropUndefinedKeys
let setX = (t, x) => Core.setKey(t, "x", x)->Core.dropUndefinedKeys
let setY = (t, y) => Core.setKey(t, "y", y)->Core.dropUndefinedKeys
