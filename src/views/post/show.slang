h1 Show Post
p = post.title
p = post.url
p
  == link_to("back", "/", class: "btn btn-light btn-sm")
  == link_to("edit", "/#{post.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/#{post.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
