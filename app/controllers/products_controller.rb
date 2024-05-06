class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        render inertia: "products/index", props: {}
    end

    def create
        product_id = Product.create(params)
        product_option_id = ProductOption.create(product_id, params)
        #ProductOptionKind.create(product_id, params)
        #ProductImage.create(product_id, params)
        ProductPrice.create(product_id, params)
        #ProductStock.create(product_id, params)
        
        render inertia: "products/show", props: {}
    end

    def show
        render inertia: "products/show", props: {}
    end
end
