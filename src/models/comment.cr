class Comment < Granite::Base
  connection pg
  table comments

  belongs_to :post
  belongs_to :user

  column id : Int64, primary: true
  column body : String?
  timestamps
end
