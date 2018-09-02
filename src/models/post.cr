class Post < Granite::Base
  adapter pg
  table_name posts

  # id : Int64 primary key is created for you
  field title : String
  field url : String
  timestamps
end
