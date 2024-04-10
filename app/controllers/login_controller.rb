class LoginController < ApplicationController
    def index
        render inertia: "login/index", props: {}
    end
end
