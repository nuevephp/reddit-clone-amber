require "./spec_helper"

def comment_hash
  {"post_id" => "1", "body" => "Fake", "user_id" => "1"}
end

def comment_params
  params = [] of String
  params << "post_id=#{comment_hash["post_id"]}"
  params << "body=#{comment_hash["body"]}"
  params << "user_id=#{comment_hash["user_id"]}"
  params.join("&")
end

def create_comment
  model = Comment.new(comment_hash)
  model.save
  model
end

class CommentControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe CommentControllerTest do
  subject = CommentControllerTest.new

  it "renders comment index template" do
    Comment.clear
    response = subject.get "/comments"

    response.status_code.should eq(200)
    response.body.should contain("comments")
  end

  it "renders comment show template" do
    Comment.clear
    model = create_comment
    location = "/comments/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Comment")
  end

  it "renders comment new template" do
    Comment.clear
    location = "/comments/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Comment")
  end

  it "renders comment edit template" do
    Comment.clear
    model = create_comment
    location = "/comments/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Comment")
  end

  it "creates a comment" do
    Comment.clear
    response = subject.post "/comments", body: comment_params

    response.headers["Location"].should eq "/comments"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a comment" do
    Comment.clear
    model = create_comment
    response = subject.patch "/comments/#{model.id}", body: comment_params

    response.headers["Location"].should eq "/comments"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a comment" do
    Comment.clear
    model = create_comment
    response = subject.delete "/comments/#{model.id}"

    response.headers["Location"].should eq "/comments"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
