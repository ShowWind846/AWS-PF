class HomesController < ApplicationController
    
    def index
    end
    
    def about
    end
    
    def mypage
        @user = User.find(current_user.id)
    end
    
end
