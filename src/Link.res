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
  fontScaling: option<bool>,
  fontWeight: option<string>,
  highlightColor: option<Color.t>,
  highlightFontColor: option<Color.t>,
  highlightFontSize: option<float>,
  highlightFontWeight: option<string>,
  labelProperty: option<t<'payload> => React.element>,
  mouseCursor: option<MouseCursor.t>,
  opacity: option<float>,
  renderLabel: option<bool>,
  semanticStrokeWidth: option<bool>,
  strokeWidth: option<float>,
  markerStart: option<string>,
  markerEnd: option<string>,
  markerHeight: option<float>,
  markerWidth: option<float>,
  @as("type") curveType: option<CurveType.t>,
  strokeDasharray: option<float>,
  strokeDashoffset: option<float>,
  strokeLinecap: option<LineCap.t>,
  offsetSource: option<(option<{"id": Node.Id.t, "x": float, "y": float}>,
                        option<{"id": Node.Id.t, "x": float, "y": float}>,
                        option<array<{"x": float, "y": float}>>) => {"dx": float, "dy": float}>,
  offsetTarget: option<(option<{"id": Node.Id.t, "x": float, "y": float}>,
                        option<{"id": Node.Id.t, "x": float, "y": float}>,
                        option<array<{"x": float, "y": float}>>) => {"dx": float, "dy": float}>,
}

module Config = {
  type link<'payload> = t<'payload>
  type t<'payload> = config<'payload> = {
    color: option<Color.t>,
    fontColor: option<Color.t>,
    fontSize: option<float>,
    fontScaling: option<bool>,
    fontWeight: option<string>,
    highlightColor: option<Color.t>,
    highlightFontColor: option<Color.t>,
    highlightFontSize: option<float>,
    highlightFontWeight: option<string>,
    labelProperty: option<link<'payload> => React.element>,
    mouseCursor: option<MouseCursor.t>,
    opacity: option<float>,
    renderLabel: option<bool>,
    semanticStrokeWidth: option<bool>,
    strokeWidth: option<float>,
    markerStart: option<string>,
    markerEnd: option<string>,
    markerHeight: option<float>,
    markerWidth: option<float>,
    @as("type") curveType: option<CurveType.t>,
    strokeDasharray: option<float>,
    strokeDashoffset: option<float>,
    strokeLinecap: option<LineCap.t>,
    offsetSource: option<(option<{"id": Node.Id.t, "x": float, "y": float}>,
                          option<{"id": Node.Id.t, "x": float, "y": float}>,
                          option<array<{"x": float, "y": float}>>) => {"dx": float, "dy": float}>,
    offsetTarget: option<(option<{"id": Node.Id.t, "x": float, "y": float}>,
                          option<{"id": Node.Id.t, "x": float, "y": float}>,
                          option<array<{"x": float, "y": float}>>) => {"dx": float, "dy": float}>,
  }

  let create = (
    ~color=?,
    ~fontColor=?,
    ~fontSize=?,
    ~fontScaling=?,
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
    ~markerStart=?,
    ~markerEnd=?,
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
      fontScaling: fontScaling,
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
      markerStart: markerStart,
      markerEnd: markerEnd,
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

let setId = (t, id) => t->Core.duplicate->Core.setKey("id", id)
let setSource = (t, source) => t->Core.duplicate->Core.setKey("source", source)
let setTarget = (t, target) => t->Core.duplicate->Core.setKey("target", target)
let updateConfig = (t: t<'a>, f) => {
  let t' = Core.duplicate(t)
  let cfg: Config.t<'a> = Obj.magic(t')
  let newcfg = f(cfg)
  let t'': t<'a> = Core.pack(t', newcfg)
  t''->Core.dropUndefinedKeys
}
let updatePayload = (t, f) => {
  let p = Core.readKey(t, "payload")
  Core.setKey(t, "payload", f(p))->Core.dropUndefinedKeys
}
