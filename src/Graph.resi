@react.component
let make: (
  ~id: string,
  ~data: Data.t<'n, 'e>=?,
  ~config: Config.t<'n, 'e>=?,
  ~onClickGraph: ReactEvent.Synthetic.t => unit=?,
  ~onClickNode: (ReactEvent.Synthetic.t, Node.Id.t, Node.t<'n>) => unit=?,
  ~onDoubleClickNode: (ReactEvent.Synthetic.t, Node.Id.t, Node.t<'n>) => unit=?,
  ~onRightClickNode: (ReactEvent.Synthetic.t, Node.Id.t, Node.t<'n>) => unit=?,
  ~onClickLink: (ReactEvent.Synthetic.t, ~source: Node.Id.t, ~target: Node.Id.t) => unit=?,
  ~onRightClickLink: (ReactEvent.Synthetic.t, ~source: Node.Id.t, ~target: Node.Id.t) => unit=?,
  ~onMouseOverNode: (ReactEvent.Synthetic.t, Node.Id.t, Node.t<'n>) => unit=?,
  ~onMouseOutNode: (ReactEvent.Synthetic.t, Node.Id.t, Node.t<'n>) => unit=?,
  ~onMouseOverLink: (ReactEvent.Synthetic.t, ~source: Node.Id.t, ~target: Node.Id.t) => unit=?,
  ~onMouseOutLink: (ReactEvent.Synthetic.t, ~source: Node.Id.t, ~target: Node.Id.t) => unit=?,
  ~onNodePositionChange: (Node.Id.t, ~x: float, ~y: float) => unit=?,
  ~onZoomChange: (~oldZoom: float, ~newZoom: float) => unit=?,
) => React.element
