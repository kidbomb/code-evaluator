class Challenge < ActiveRecord::Base
 validates :name, :presence => true

 has_many :problems
end
