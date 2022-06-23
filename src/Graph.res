module Selection = {
  type t = {
    nodes: array<Node.Id.t>,
    links: array<Link.Id.t>,
  }

  let empty = {
    nodes: [],
    links: [],
  }
}

module ViewTransform = {
  type t
  @module("d3-zoom")
  @val external init: t = "zoomIdentity"
}

@module("react-d3-graph") @react.component
external make: (
  ~id: string,
  ~data: Data.t<'n, 'e>=?,
  ~selection: Selection.t=?,
  ~config: Config.t<'n, 'e>=?,
  ~style: ReactDOM.Style.t=?,
  ~keybindings: Js.Dict.t<(ReactEvent.Keyboard.t, ~x: float, ~y: float) => unit>=?,
  ~showGrid: bool=?,
  ~viewTransform: ViewTransform.t=?,
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
  ~onZoomChange: (~oldZoom: ViewTransform.t, ~newZoom: ViewTransform.t) => unit=?,
  ~onSelectionChange: (~oldSelection: Selection.t, ~newSelection: Selection.t) => unit=?,
) => React.element = "Graph"
