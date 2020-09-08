h1 Show Comment
p = comment.post.id
p = comment.body
p = comment.user.id
p
  == link_to("Back", "/comments", class: "btn btn-light btn-sm")
  == link_to("Edit", "/comments/#{comment.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/comments/#{comment.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
