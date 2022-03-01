type t<'n, 'e>

module Global: {
  type t = {
    automaticRearrangeAfterDropNode: option<bool>,
    collapsible: option<bool>,
    directed: option<bool>,
    defs: option<array<React.element>>,
    initialZoom: option<float>,
    focusZoom: option<float>,
    maxZoom: option<float>,
    minZoom: option<float>,
    freezeAllDragEvents: option<bool>,
    focusAnimationDuration: option<float>,
    width: option<string>,
    height: option<string>,
    nodeHighlightBehavior: option<bool>,
    linkHighlightBehavior: option<bool>,
    highlightDegree: option<int>,
    highlightOpacity: option<float>,
    panAndZoom: option<bool>,
    staticGraph: option<bool>,
    staticGraphWithDragAndDrop: option<bool>,
  }

  let create: (
    ~automaticRearrangeAfterDropNode: bool=?,
    ~collapsible: bool=?,
    ~directed: bool=?,
    ~defs: array<React.element>=?,
    ~initialZoom: float=?,
    ~focusZoom: float=?,
    ~maxZoom: float=?,
    ~minZoom: float=?,
    ~freezeAllDragEvents: bool=?,
    ~focusAnimationDuration: float=?,
    ~width: string=?,
    ~height: string=?,
    ~nodeHighlightBehavior: bool=?,
    ~linkHighlightBehavior: bool=?,
    ~highlightDegree: int=?,
    ~highlightOpacity: float=?,
    ~panAndZoom: bool=?,
    ~staticGraph: bool=?,
    ~staticGraphWithDragAndDrop: bool=?,
    unit,
  ) => t
}

module D3: {
  type t = {
    alphaTarget: option<float>,
    gravity: option<float>,
    linkLength: option<float>,
    linkStrength: option<float>,
    disableLinkForce: option<bool>,
  }

  let create: (
    ~alphaTarget: float=?,
    ~gravity: float=?,
    ~linkLength: float=?,
    ~linkStrength: float=?,
    ~disableLinkForce: bool=?,
    unit,
  ) => t
}

let create: (
  ~global: Global.t=?,
  ~d3: D3.t=?,
  ~node: Node.Config.t<'n>=?,
  ~link: Link.Config.t<'e>=?,
  unit,
) => t<'n, 'e>
