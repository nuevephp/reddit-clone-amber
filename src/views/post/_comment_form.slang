== form(action: "/comments/", method: :post) do
  == csrf_tag
  == hidden_field(name: "post_id", value: post.id)
  .form-group
    == text_area(name: "body", content: "", placeholder: "Body", class: "form-control", size: "30x2")
  == submit("Add Comment", class: "btn btn-primary btn-sm")