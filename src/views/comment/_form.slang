- if comment.errors
  ul.errors
    - comment.errors.each do |error|
      li = error.to_s

== form(action: "/comments/#{comment.id.to_s}", method: comment.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == label(:post)
    == select_field(name: "post_id", collection: Post.all.map{|post| [post.id, post.id]}, selected: comment.post_id, class: "form-control")
  .form-group
    == text_area(name: "body", content: comment.body, placeholder: "Body", class: "form-control", size: "30x10")
  .form-group
    == label(:user)
    == select_field(name: "user_id", collection: User.all.map{|user| [user.id, user.id]}, selected: comment.user_id, class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/comments", class: "btn btn-light btn-sm")
