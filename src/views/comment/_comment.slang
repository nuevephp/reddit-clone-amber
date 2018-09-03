- post.comments.each do |comment|
  .comments_wrapper
    .pull-left
      p.lead #{comment.body}
      p
        small
          | Submitted #{time_to_string(comment.created_at.not_nil!)} by #{comment.user.email}
    .btn-group.pull-right
      - if (current_user = context.current_user) && (comment.user.id == current_user.id)
        == link_to("Destroy", "/comments/#{comment.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-outline-secondary")