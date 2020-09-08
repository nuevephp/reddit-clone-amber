.row
  .col-sm-11
    h2 Comments
  .col-sm-1
    a.btn.btn-success.btn-sm href="/comments/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Post
        th Body
        th User
        th Actions
    tbody
      - comments.each do |comment|
        tr
          td = comment.post.id
          td = comment.body
          td = comment.user.id
          td
            span
              == link_to("Show", "/comments/#{comment.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/comments/#{comment.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/comments/#{ comment.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
