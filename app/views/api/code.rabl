# app/views/api/code.rabl

object @target
attributes :name, :url1, :url2, :url3

glue @code do
  attribute :type
end

glue @person do
  attribute :name => :person 
end

node(:history, :if => lambda {|a| @history }) do 
  @history.map {|enc| {:date => enc.created_at,
                       :comment => enc.comment,
                       :rating  => enc.rating }}
end

