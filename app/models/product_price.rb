class ProductPrice < ApplicationRecord
    @table_name = "products_price"

    belongs_to :product

    def self.create(product_id, params)
        product_price = self.new
        product_price.product_id = product_id
        product_price.price = params[:price]
        product_price.wonga = params[:wonga]
        product_price.create_at = Time.now
        product_price.save!
    end

    def self.find_by_id(product_id)
        return self.find_by(product_id: product_id)
    end

    def self.update_by_id(params)
        product_price = self.find_by(product_id: params[:product_id])
        product_price.update(price: params[:price])
    end
end