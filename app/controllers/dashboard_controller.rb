class DashboardController < ApplicationController
    def index
        render inertia: "dashboard/index", props: {}
    end
end
