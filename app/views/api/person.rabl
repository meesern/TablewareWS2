# app/views/api/person.rabl

object @person
attributes :name, :favourites, :offers

node(:history, :if => lambda {|a| @history }) do 
  @history.map {|enc| {:date => enc.created_at,
                       :dish => enc.dish.name,
                       :comment => enc.comment,
                       :rating  => enc.rating }}
end

