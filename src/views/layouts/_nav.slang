- if (current_user = context.current_user)
  - active = context.request.path == "/new" ? "active" : ""
  li class="nav-item #{active}"
    a href="/new"
      | Submit
  
  li class="nav-item nav-item-auth nav-item-auth-signout"
    a href="/signout"
      | Sign Out
  
  - active = context.request.path == "/profile" ? "active" : ""
  li class="nav-item nav-item-auth nav-item-auth-profile #{active}"
    a href="/profile"
      == current_user.email
- else
  - active = context.request.path == "/signup" ? "active" : ""
  li class="nav-item nav-item-auth nav-item-auth-signup #{active}"
    a href="/signup"
      | Sign Up
  - active = context.request.path == "/signin" ? "active" : ""
  li class="nav-item nav-item-auth nav-item-auth-signin #{active}"
    a href="/signin"
      | Sign In
