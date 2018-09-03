h1 Show Comment
p = comment.post_id
p = comment.body
p = comment.user.id
p
  == link_to("back", "/comments", class: "btn btn-light btn-sm")
  == link_to("edit", "/comments/#{comment.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/comments/#{comment.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
