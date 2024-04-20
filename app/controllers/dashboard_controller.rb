class DashboardController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    
    def index
        render inertia: "dashboard/index", props: {}
    end
end
