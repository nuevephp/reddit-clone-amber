class HTTP::Server::Context
  property current_user : User?
end

class CurrentUser < Amber::Pipe::Base
  def call(context)
    user_id = context.session["user_id"]?
    if user = User.find user_id
      context.current_user = user
    end
    call_next(context)
  end
end

class Authenticate < Amber::Pipe::Base
  PUBLIC_PATHS = ["/", "/posts", "/signin", "/session", "/signup", "/registration"]
  REGEX_PATHS = [
    /^\/posts\/([0-9]+)$/,
  ]

  def call(context)
    if context.current_user
      call_next(context)
    else
      return call_next(context) if public_path?(context.request.path)
      context.flash[:warning] = "Please Sign In"
      context.response.headers.add "Location", "/signin"
      context.response.status_code = 302
    end
  end

  private def public_path?(path)
    return true if PUBLIC_PATHS.includes?(path)
    REGEX_PATHS.any? { |word| path =~ word }
  end
end
