class Inventory < ActiveRecord::Base
    belongs_to :user
    #validates ${:username}
end
