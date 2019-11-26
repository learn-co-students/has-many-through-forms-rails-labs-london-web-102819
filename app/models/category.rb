class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories


  def self.find_or_create_by(category_attributes)

    result = Category.find_by(category_attributes)
    
    result = Category.create(category_attributes) if !result

    result

  end

end
