- posts.each do |post|
  .link.row.mb-4
    h2
      == link_to("#{post.title}", "/posts/#{post.id}")
      br
      small.author
        | Submitted #{time_to_string(post.created_at.not_nil!)} by #{post.user.name}