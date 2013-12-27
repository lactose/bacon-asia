module Users
  class AccountsController < Controller
    before_filter :require_login

    def show
      @user = current_user
    end
  end
end
