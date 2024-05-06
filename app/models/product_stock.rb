class ProductStock < ApplicationRecord
    @table_name = "products_stock"

    belongs_to :product

    def self.create(params)
       product_stock = self.new
        product_stock.product_id = params[:product_id]
        product_stock.product_option_id = params[:product_option_id]
        product_stock.stock = params[:stock]
        product_stock.create_at = Time.now
        product_stock.save! 
    end

    def self.find_by_id(product_id)
        return self.find_by(product_id: product_id)
    end

    def self.update_by_id(params)
        product_stock = self.find_by(product_id: params[:product_id])
        product_stock.update(stock: params[:stock])
    end
end