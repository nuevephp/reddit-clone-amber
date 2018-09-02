.row
  .col-sm-11
    h2 Posts
  .col-sm-1
    a.btn.btn-success.btn-sm href="/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Title
        th Url
        th Actions
    tbody
      - posts.each do |post|
        tr
          td = post.title
          td = post.url
          td
            span
              == link_to("read", "/#{post.id}", class: "btn btn-primary btn-sm")
              - if (current_user = context.current_user) && (post.user.id == current_user.id)
                == link_to("edit", "/#{post.id}/edit", class: "btn btn-success btn-sm")
                == link_to("delete", "/#{ post.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
