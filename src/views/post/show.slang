.mt-5.mb-4.pb-3.border-bottom
  h2 
    == link_to("#{post.title}", "#{post.url}")
    br
    small.author
      | Submitted #{time_to_string(post.created_at.not_nil!)} by #{post.user.name}

.btn-group
  == link_to("Visit URL", "#{post.url}", class: "btn btn-primary")
  - if (current_user = context.current_user) && (post.user.id == current_user.id)
    == link_to("Edit", "/posts/#{post.id}/edit", class: "btn btn-outline-secondary")
    == link_to("Delete", "/posts/#{post.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-outline-secondary")

h3.comments_title
  | #{post.comments.size} Comments

#comments.mb-3
  == render(partial: "comment/_comment.slang")

- if (current_user = context.current_user)
  == render(partial: "post/_comment_form.slang")