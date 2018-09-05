class HomeController < ApplicationController
  def index
    posts = Post.all
    render "post/index.slang"
  end
end
