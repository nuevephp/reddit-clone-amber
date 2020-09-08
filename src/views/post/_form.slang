- if post.errors
  ul.errors
    - post.errors.each do |error|
      li = error.to_s

== form(action: "/posts/#{post.id.to_s}", method: post.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "title", value: post.title, placeholder: "Title", class: "form-control")
  .form-group
    == text_field(name: "url", value: post.url, placeholder: "Url", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/posts", class: "btn btn-light btn-sm")
