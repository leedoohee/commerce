class Product < ApplicationRecord
    @table_name = "products"

    has_many :product_image
    has_many :product_option
    has_many :product_option_kind
    has_one :product_price

    def self.create(params)
        product = self.new
        product.name = params[:name]
        product.state = params[:state]
        product.category_id = params[:category_id]
        product.company = params[:company]
        product.origin = params[:origin]
        product.margin_rate = params[:margin_rate]
        product.tax_yn = params[:tax_yn]
        product.introduce_img_src = params[:introduce_img_src]
        product.create_at = Time.now
        product.save!

        return product.id
    end

    def self.find_by_id(product_id)
        return self.find_by(product_id: product_id)
    end

    def self.update_by_id(params)
        product = self.find_by(product_id: params[:product_id])
        product.update(name: params[:name], state: params[:state], category_id: params[:category_id], company: params[:company], origin: params[:origin], margin_rate: params[:margin_rate], tax_yn: params[:tax_yn], introduce_img_src: params[:introduce_img_src], updater_id: current_user.name, update_at: Time.now)
    end
end