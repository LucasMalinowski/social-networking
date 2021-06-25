class ProfilesController < UserController

  def show
    @user = User.find_by(name: params[:id])
  end
end