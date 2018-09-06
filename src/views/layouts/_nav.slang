- if (current_user = context.current_user)
  - active = context.request.path == "/posts/new" ? "active" : ""
  li class="nav-item #{active}"
    a class="nav-link #{active}" href="/posts/new"
      | Submit
  
  li class="nav-item nav-item-auth nav-item-auth-signout"
    a class="nav-link" href="/signout"
      | Sign Out
  
  - active = context.request.path == "/profile" ? "active" : ""
  li class="nav-item nav-item-auth nav-item-auth-profile #{active}"
    a class="nav-link #{active}" href="/profile"
      == current_user.name
- else
  - active = context.request.path == "/signup" ? "active" : ""
  li class="nav-item nav-item-auth nav-item-auth-signup #{active}"
    a class="nav-link #{active}" href="/signup"
      | Sign Up
  - active = context.request.path == "/signin" ? "active" : ""
  li class="nav-item nav-item-auth nav-item-auth-signin #{active}"
    a class="nav-link #{active}" href="/signin"
      | Sign In
