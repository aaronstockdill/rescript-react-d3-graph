type t<'payload>

module CurveType: {
  type t

  let straight: t
  let smooth: t // A slight bend
  let full: t // Follow a circle arc
}

module LineCap: {
  type t

  let butt: t
  let round: t
  let square: t
}

module Config: {
  type t<'payload> = {
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
  }
}

let create: (
  ~source: Node.Id.t,
  ~target: Node.Id.t,
  ~payload: 'payload=?,
  ~config: Config.t<'payload>=?,
  ~breakpoints: array<{"x": float, "y": float}>=?,
  unit,
) => t<'payload>
