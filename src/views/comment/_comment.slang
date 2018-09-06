- post.comments.each do |comment|
  .comments_wrapper.d-flex.flex-wrap.align-items-center.mb-2.pt-3.pb-3.border-top.border-light
    .content.flex-grow-1
      p.lead #{comment.body}
      p
        small
          | Submitted #{time_to_string(comment.created_at.not_nil!)} by #{comment.user.name}
    .btn-group
      - if (current_user = context.current_user) && (comment.user.id == current_user.id)
        == link_to("Delete", "/comments/#{comment.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-outline-secondary btn-sm")