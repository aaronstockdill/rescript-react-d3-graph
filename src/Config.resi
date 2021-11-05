type t<'n, 'e>

module Global : {
  type t = {
    automaticRearrangeAfterDropNode: option<bool>,
    collapsible: option<bool>,
    directed: option<bool>,
    initialZoom: option<float>,
    focusZoom: option<float>,
    maxZoom: option<float>,
    minZoom: option<float>,
    freezeAllDragEvents: option<bool>,
    focusAnimationDuration: option<bool>,
    width: option<int>,
    height: option<int>,
    nodeHighlightBehavior: option<bool>,
    linkHighlightBehavior: option<bool>,
    highlightDegree: option<int>,
    highlightOpacity: option<float>,
    panAndZoom: option<bool>,
    staticGraph: option<bool>,
    staticGraphWithDragAndDrop: option<bool>,
  }
}

module D3 : {
  type t = {
    alphaTarget: option<float>,
    gravity: option<float>,
    linkLength: option<float>,
    linkStrength: option<float>,
    disableLinkForce: option<bool>
  }
}

let create: (
  ~global: Global.t=?,
  ~d3: D3.t=?,
  ~node: Node.Config.t<'n>=?,
  ~link: Link.Config.t<'e>=?,
  unit
) => t<'n, 'e>
