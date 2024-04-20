class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        render inertia: "products/index", props: {}
    end

    def show
        render inertia: "products/show", props: {}
    end
end
