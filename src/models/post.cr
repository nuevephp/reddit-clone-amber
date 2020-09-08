class Post < Granite::Base
  connection pg
  table posts

  belongs_to :user
  has_many :comments, class_name: Comment

  column id : Int64, primary: true
  column title : String?
  column url : String?
  timestamps
end
