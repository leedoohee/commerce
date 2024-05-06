class ProductOptionKind < ApplicationRecord
    @table_name = "products_option_kind"

    belongs_to :product_option

    def self.create(params)
        product_option_kind = self.new
        product_option_kind.product_option_id = params[:product_option_id]
        product_option_kind.name = params[:name]
        product_option_kind.save!
    end

    def self.find_by_id(product_option_kind_id)
        return self.find_by(product_option_kind_id: product_option_kind_id)
    end

    def self.update_by_id(params)
        product_option_kind = self.find_by(product_option_kind_id: params[:product_option_kind_id])
        product_option_kind.update(name: params[:name])
    end

    
end