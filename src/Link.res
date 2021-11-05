module CurveType = {
  type t = string

  let straight = "straight"
  let smooth = "smooth"
  let full = "full"
}

module LineCap = {
  type t = string

  let butt = "butt"
  let round = "round"
  let square = "square"
}

type rec t<'payload> = {
  source: Node.Id.t,
  target: Node.Id.t,
  payload: option<'payload>,
  breakpoints: option<array<{"x": float, "y": float}>>,
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
  labelProperty: option<(t<'payload> => string)>,
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
  strokeLinecap: option<LineCap.t>
}

module Config = {
  type t<'payload> = config<'payload> = {
    color: option<Color.t>,
    fontColor: option<Color.t>,
    fontSize: option<float>,
    fontWeight: option<string>,
    highlightColor: option<Color.t>,
    highlightFontColor: option<Color.t>,
    highlightFontSize: option<float>,
    highlightFontWeight: option<string>,
    labelProperty: option<(t<'payload> => string)>,
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
    strokeLinecap: option<LineCap.t>
  }
}

let create = (
  ~source,
  ~target,
  ~payload=?,
  ~config=?,
  ~breakpoints=?,
  _
) => {
  {
    source: source,
    target: target,
    payload: payload,
    breakpoints: breakpoints,
    config: None
  }->Core.pack(config)->Core.dropUndefinedKeys
}
