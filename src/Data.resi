type t<'n, 'e> = {
  nodes: array<Node.t<'n>>,
  links: array<Link.t<'e>>,
}

let empty: unit => t<'n, 'e>
