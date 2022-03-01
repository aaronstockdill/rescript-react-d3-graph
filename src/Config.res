module Global = {
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

  let create = (
    ~automaticRearrangeAfterDropNode=?,
    ~collapsible=?,
    ~directed=?,
    ~defs=?,
    ~initialZoom=?,
    ~focusZoom=?,
    ~maxZoom=?,
    ~minZoom=?,
    ~freezeAllDragEvents=?,
    ~focusAnimationDuration=?,
    ~width=?,
    ~height=?,
    ~nodeHighlightBehavior=?,
    ~linkHighlightBehavior=?,
    ~highlightDegree=?,
    ~highlightOpacity=?,
    ~panAndZoom=?,
    ~staticGraph=?,
    ~staticGraphWithDragAndDrop=?,
    _,
  ) =>
    {
      automaticRearrangeAfterDropNode: automaticRearrangeAfterDropNode,
      collapsible: collapsible,
      directed: directed,
      defs: defs,
      initialZoom: initialZoom,
      focusZoom: focusZoom,
      maxZoom: maxZoom,
      minZoom: minZoom,
      freezeAllDragEvents: freezeAllDragEvents,
      focusAnimationDuration: focusAnimationDuration,
      width: width,
      height: height,
      nodeHighlightBehavior: nodeHighlightBehavior,
      linkHighlightBehavior: linkHighlightBehavior,
      highlightDegree: highlightDegree,
      highlightOpacity: highlightOpacity,
      panAndZoom: panAndZoom,
      staticGraph: staticGraph,
      staticGraphWithDragAndDrop: staticGraphWithDragAndDrop,
    }->Core.dropUndefinedKeys
}

module D3 = {
  type t = {
    alphaTarget: option<float>,
    gravity: option<float>,
    linkLength: option<float>,
    linkStrength: option<float>,
    disableLinkForce: option<bool>,
  }

  let create = (
    ~alphaTarget=?,
    ~gravity=?,
    ~linkLength=?,
    ~linkStrength=?,
    ~disableLinkForce=?,
    _,
  ) =>
    {
      alphaTarget: alphaTarget,
      gravity: gravity,
      linkLength: linkLength,
      linkStrength: linkStrength,
      disableLinkForce: disableLinkForce,
    }->Core.dropUndefinedKeys
}

type t<'n, 'e> = {
  global: option<Global.t>,
  d3: option<D3.t>,
  node: option<Node.Config.t<'n>>,
  link: option<Link.Config.t<'e>>,
}

let create = (~global=?, ~d3=?, ~node=?, ~link=?, _) => {
  let cfg = {
    d3: d3,
    node: node,
    link: link,
    global: None,
  }
  switch global {
  | Some(g) => Core.pack(g, cfg)
  | None => cfg
  }->Core.dropUndefinedKeys
}
