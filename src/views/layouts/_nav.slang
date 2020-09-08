- if (current_user = context.current_user)
  - active = context.request.path == "/posts/new" ? "active" : ""
  li.nav-item class=active
    a class="nav-link" href="/posts/new" Submit
