type t<'payload>

module Id: {
  type t
  let ofString: string => t
  let toString: t => string
}

module LabelPosition: {
  type t
  let left: t
  let right: t
  let top: t
  let bottom: t
  let center: t
}

module SymbolType: {
  type t
  let circle: t
  let cross: t
  let diamond: t
  let square: t
  let star: t
  let triangle: t
  let wye: t
}

module Config: {
  type node<'payload> = t<'payload>
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

  let create: (
    ~color: Color.t=?,
    ~fontColor: Color.t=?,
    ~fontSize: float=?,
    ~fontWeight: string=?,
    ~highlightColor: Color.t=?,
    ~highlightFontSize: float=?,
    ~highlightFontWeight: string=?,
    ~highlightStrokeColor: Color.t=?,
    ~highlightStrokeWidth: float=?,
    ~labelPosition: LabelPosition.t=?,
    ~labelProperty: node<'a> => string=?,
    ~mouseCursor: MouseCursor.t=?,
    ~opacity: float=?,
    ~renderLabel: bool=?,
    ~size: {"width": float, "height": float}=?,
    ~strokeColor: Color.t=?,
    ~strokeWidth: float=?,
    ~svg: string=?,
    ~symbolType: SymbolType.t=?,
    ~viewGenerator: node<'a> => React.element=?,
    unit,
  ) => t<'a>
}

let create: (
  ~id: Id.t,
  ~payload: 'payload=?,
  ~config: Config.t<'payload>=?,
  ~x: float=?,
  ~y: float=?,
  unit,
) => t<'payload>

let id: t<'payload> => Id.t
let payload: t<'payload> => option<'payload>
let x: t<'payload> => float
let y: t<'payload> => float
let selected: t<'payload> => bool

let updatePayload: (t<'p>, option<'p> => option<'q>) => t<'q>
let updateConfig: (t<'p>, Config.t<'p> => Config.t<'p>) => t<'p>
let setId: (t<'p>, Id.t) => t<'p>
let setX: (t<'p>, float) => t<'p>
let setY: (t<'p>, float) => t<'p>
