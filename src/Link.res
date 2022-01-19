module CurveType = {
  type t = string

  let straight = "STRAIGHT"
  let smooth = "SMOOTH"
  let full = "FULL"
  let catmullRom = "CATMULL_ROM"
}

module LineCap = {
  type t = string

  let butt = "butt"
  let round = "round"
  let square = "square"
}

module Id = {
  type t = string
  let ofString = t => t
  let toString = t => t
}

type rec t<'payload> = {
  source: Node.Id.t,
  target: Node.Id.t,
  id: option<Id.t>,
  payload: option<'payload>,
  breakpoints: option<array<{"x": float, "y": float}>>,
  selected: bool,
  config: option<config<'payload>>,
}
and config<'payload> = {
  color: option<Color.t>,
  fontColor: option<Color.t>,
  fontSize: option<float>,
  fontWeight: option<string>,
  highlightColor: option<Color.t>,
  highlightFontColor: option<Color.t>,
  highlightFontSize: option<float>,
  highlightFontWeight: option<string>,
  labelProperty: option<t<'payload> => string>,
  mouseCursor: option<MouseCursor.t>,
  opacity: option<float>,
  renderLabel: option<bool>,
  semanticStrokeWidth: option<bool>,
  strokeWidth: option<float>,
  markerHeight: option<float>,
  markerWidth: option<float>,
  @as("type") curveType: option<CurveType.t>,
  strokeDasharray: option<float>,
  strokeDashoffset: option<float>,
  strokeLinecap: option<LineCap.t>,
  offsetSource: option<{"dx": float, "dy": float}>,
  offsetTarget: option<{"dx": float, "dy": float}>,
}

module Config = {
  type link<'payload> = t<'payload>
  type t<'payload> = config<'payload> = {
    color: option<Color.t>,
    fontColor: option<Color.t>,
    fontSize: option<float>,
    fontWeight: option<string>,
    highlightColor: option<Color.t>,
    highlightFontColor: option<Color.t>,
    highlightFontSize: option<float>,
    highlightFontWeight: option<string>,
    labelProperty: option<link<'payload> => string>,
    mouseCursor: option<MouseCursor.t>,
    opacity: option<float>,
    renderLabel: option<bool>,
    semanticStrokeWidth: option<bool>,
    strokeWidth: option<float>,
    markerHeight: option<float>,
    markerWidth: option<float>,
    @as("type") curveType: option<CurveType.t>,
    strokeDasharray: option<float>,
    strokeDashoffset: option<float>,
    strokeLinecap: option<LineCap.t>,
    offsetSource: option<{"dx": float, "dy": float}>,
    offsetTarget: option<{"dx": float, "dy": float}>,
  }

  let create = (
    ~color=?,
    ~fontColor=?,
    ~fontSize=?,
    ~fontWeight=?,
    ~highlightColor=?,
    ~highlightFontColor=?,
    ~highlightFontSize=?,
    ~highlightFontWeight=?,
    ~labelProperty=?,
    ~mouseCursor=?,
    ~opacity=?,
    ~renderLabel=?,
    ~semanticStrokeWidth=?,
    ~strokeWidth=?,
    ~markerHeight=?,
    ~markerWidth=?,
    ~curveType=?,
    ~strokeDasharray=?,
    ~strokeDashoffset=?,
    ~strokeLinecap=?,
    ~offsetSource=?,
    ~offsetTarget=?,
    _,
  ) =>
    {
      color: color,
      fontColor: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      highlightColor: highlightColor,
      highlightFontColor: highlightFontColor,
      highlightFontSize: highlightFontSize,
      highlightFontWeight: highlightFontWeight,
      labelProperty: labelProperty,
      mouseCursor: mouseCursor,
      opacity: opacity,
      renderLabel: renderLabel,
      semanticStrokeWidth: semanticStrokeWidth,
      strokeWidth: strokeWidth,
      markerHeight: markerHeight,
      markerWidth: markerWidth,
      curveType: curveType,
      strokeDasharray: strokeDasharray,
      strokeDashoffset: strokeDashoffset,
      strokeLinecap: strokeLinecap,
      offsetSource: offsetSource,
      offsetTarget: offsetTarget,
    }->Core.dropUndefinedKeys
}

let create = (~source, ~target, ~id=?, ~payload=?, ~config=?, ~breakpoints=?, _) => {
  {
    source: source,
    target: target,
    id: id,
    payload: payload,
    breakpoints: breakpoints,
    selected: false,
    config: None,
  }
  ->Core.pack(config)
  ->Core.dropUndefinedKeys
}

let source = t => Core.readKeyExn(t, "source")
let target = t => Core.readKeyExn(t, "target")
let id = t => Core.readKey(t, "id")
let payload = t => Core.readKey(t, "payload")
let selected = t => Core.readKey(t, "selected")->Belt.Option.getWithDefault(false)
