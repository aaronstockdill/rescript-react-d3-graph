@react.component
let make: (
  ~id: string,
  ~data: Data.t<'n, 'e>=?,
  ~config: Config.t<'n, 'e>=?,
  ~onClickGraph: Dom.event => unit=?,
  ~onClickNode: (Node.Id.t, Node.t<'n>) => unit=?,
  ~onDoubleClickNode: (Node.Id.t, Node.t<'n>) => unit=?,
  ~onRightClickNode: (Dom.event, Node.Id.t, Node.t<'n>) => unit=?,
  ~onClickLink: (~source: Node.Id.t, ~target: Node.Id.t) => unit=?,
  ~onRightClickLink: (Dom.event, ~source: Node.Id.t, ~target: Node.Id.t) => unit=?,
  ~onMouseOverNode: (Node.Id.t, Node.t<'n>) => unit=?,
  ~onMouseOutNode: (Node.Id.t, Node.t<'n>) => unit=?,
  ~onMouseOverLink: (~source: Node.Id.t, ~target: Node.Id.t) => unit=?,
  ~onMouseOutLink: (~source: Node.Id.t, ~target: Node.Id.t) => unit=?,
  ~onNodePositionChange: (Node.Id.t, ~x: float, ~y: float) => unit=?,
  ~onZoomChange: (~oldZoom: float, ~newZoom: float) => unit=?,
) => React.element
