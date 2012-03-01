# app/views/api/code.rabl

object @target
attributes :name

glue @code do
  attribute :type
end

glue @person do
  attribute :name => :person 
end

