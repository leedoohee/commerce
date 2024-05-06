class ProductOption < ApplicationRecord
    @table_name = "products_option"

    belongs_to :product
    has_many :product_option_kind
    has_many :product_stock

    def self.create(product_id, params)
        if params[:options] == 'singleOption'
            option_data = params[:optionData]
            option_data.each do |option|
                product_option = self.new
                product_option.product_id = product_id
                product_option.use_yn = 'Y'
                product_option.option_name = option
                product_option.create_at = Time.now
                product_option.save!
                ###########
                product_stock = ProductStock.new
                product_stock.product_option_id = product_option.id
                product_stock.quantity = 1
                product_stock.plus_price = 1000
                product_stock.create_at = Time.now
                product_stock.save!
            end
        else
            size_data = params[:sizeData]
            color_data = params[:colorData]
            size_data.each do |size|
                color_data.each do |color|
                    product_option = self.new
                    product_option.product_id = product_id
                    product_option.use_yn = 'Y'
                    product_option.option_name = "#{size}^#{color}"
                    product_option.create_at = Time.now
                    product_option.save!
                    #############
                    product_stock = ProductStock.new
                    product_stock.product_option_id = product_option.id
                    product_stock.quantity = 1
                    product_stock.plus_price = 1000
                    product_stock.create_at = Time.now
                    product_stock.save!
                end
            end
        end
    end

    def self.find_by_id(product_option_id)
        return self.find_by(product_option_id: product_option_id)
    end

    def self.update_by_id(params)
        product_option = self.find_by(product_option_id: params[:product_option_id])
        product_option.update(name: params[:name])
    end
end