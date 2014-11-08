class Component < ActiveRecord::Base
  has_many :component_parts
  has_many :parts, through: :component_parts
end
