class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :comment
end
