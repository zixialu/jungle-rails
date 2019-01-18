class Rating < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product_id, presence:true
  validates :user_id, validates:true
  validates :rating, validates:true
end
