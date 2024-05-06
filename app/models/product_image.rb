class ProductImage < ApplicationRecord
    @table_name = "product_image"
    
    belongs_to :product
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    def self.create(params)
        product_image = self.new
        product_image.product_id = params[:product_id]
        product_image.src = params[:src]
        product_image.use_yn = params[:use_yn]
        product_image.create_at = Time.now
        product_image.save!
    end

    def self.find_by_id(product_id)
        return self.find_by(product_id: product_id)
    end

    def self.update_by_id(params)
        product_image = self.find_by(product_id: params[:product_id])
        product_image.update(src: params[:src], use_yn: params[:use_yn], updater_id: current_user.name, update_at: Time.now)
    end
end