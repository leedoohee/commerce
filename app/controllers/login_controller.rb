class LoginController < ApplicationController
    before_action :authenticate_user, except: [:index]
    
    def index
        render inertia: "login/index", props: {}
    end
end
