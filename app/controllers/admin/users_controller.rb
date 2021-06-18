class Admin::UsersController < AdminController

  def index
    @users = User.order(id: :asc)
  end
end