class Category < ActiveRecord::Base

	belongs_to :user
	has_many :product_categories
	has_many :projects, through: :product_categories


end
