@module("react-d3-graph") @react.component
external make: (
  ~id: string,
  ~data: Data.t<'n, 'e>=?,
  ~config: Config.t<'n, 'e>=?,
  ~onClickGraph: ReactEvent.Pointer.t => unit=?,
  ~onClickNode: (ReactEvent.Pointer.t, Node.Id.t, Node.t<'n>) => unit=?,
  ~onDoubleClickNode: (ReactEvent.Pointer.t, Node.Id.t, Node.t<'n>) => unit=?,
  ~onRightClickNode: (ReactEvent.Pointer.t, Node.Id.t, Node.t<'n>) => unit=?,
  ~onClickLink: (ReactEvent.Pointer.t, ~source: Node.Id.t, ~target: Node.Id.t) => unit=?,
  ~onRightClickLink: (ReactEvent.Pointer.t, ~source: Node.Id.t, ~target: Node.Id.t) => unit=?,
  ~onMouseOverNode: (ReactEvent.Pointer.t, Node.Id.t, Node.t<'n>) => unit=?,
  ~onMouseOutNode: (ReactEvent.Pointer.t, Node.Id.t, Node.t<'n>) => unit=?,
  ~onMouseOverLink: (ReactEvent.Pointer.t, ~source: Node.Id.t, ~target: Node.Id.t) => unit=?,
  ~onMouseOutLink: (ReactEvent.Pointer.t, ~source: Node.Id.t, ~target: Node.Id.t) => unit=?,
  ~onNodePositionChange: (Node.Id.t, ~x: float, ~y: float) => unit=?,
  ~onZoomChange: (~oldZoom: float, ~newZoom: float) => unit=?,
) => React.element = "Graph"
