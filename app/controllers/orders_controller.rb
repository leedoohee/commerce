class OrdersController < ApplicationController

    def index
        render inertia: "orders/index", props: {}
    end

    def show
        render inertia: "orders/show", props: {
        
        }
    end
end
