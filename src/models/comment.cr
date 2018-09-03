class Comment < Granite::Base
  adapter pg
  table_name comments

  belongs_to :user
  belongs_to :post

  # id : Int64 primary key is created for you
  field body : String
  timestamps
end
