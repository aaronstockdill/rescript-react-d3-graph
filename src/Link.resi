type t<'payload>

module CurveType: {
  type t

  let straight: t
  let smooth: t // A slight bend
  let full: t // Follow a circle arc
  let catmullRom: t // Very smooth interpolation
}

module LineCap: {
  type t

  let butt: t
  let round: t
  let square: t
}

module Id: {
  type t

  let ofString: string => t
  let toString: t => string
}

module Config: {
  type link<'payload> = t<'payload>
  type t<'payload> = {
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

  let create: (
    ~color: Color.t=?,
    ~fontColor: Color.t=?,
    ~fontSize: float=?,
    ~fontWeight: string=?,
    ~highlightColor: Color.t=?,
    ~highlightFontColor: Color.t=?,
    ~highlightFontSize: float=?,
    ~highlightFontWeight: string=?,
    ~labelProperty: link<'payload> => string=?,
    ~mouseCursor: MouseCursor.t=?,
    ~opacity: float=?,
    ~renderLabel: bool=?,
    ~semanticStrokeWidth: bool=?,
    ~strokeWidth: float=?,
    ~markerHeight: float=?,
    ~markerWidth: float=?,
    ~curveType: CurveType.t=?,
    ~strokeDasharray: float=?,
    ~strokeDashoffset: float=?,
    ~strokeLinecap: LineCap.t=?,
    ~offsetSource: {"dx": float, "dy": float}=?,
    ~offsetTarget: {"dx": float, "dy": float}=?,
    unit,
  ) => t<'payload>
}

let create: (
  ~source: Node.Id.t,
  ~target: Node.Id.t,
  ~id: Id.t=?,
  ~payload: 'payload=?,
  ~config: Config.t<'payload>=?,
  ~breakpoints: array<{"x": float, "y": float}>=?,
  unit,
) => t<'payload>

let source: t<'payload> => Node.Id.t
let target: t<'payload> => Node.Id.t
let id: t<'payload> => option<Id.t>
let payload: t<'payload> => option<'payload>
