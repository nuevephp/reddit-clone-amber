require "./spec_helper"
require "../../src/models/comment.cr"

describe Comment do
  Spec.before_each do
    Comment.clear
  end
end
