class LoginController < ApplicationController
    #skip_before_action :authenticate_user, only: [:index]
    
    def index
        render inertia: "login/index", props: {}
    end
end
