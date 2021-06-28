class ProfilesController < UserController

  def show
    @user = User.find_by(name: params[:id])
    @comment = Comment.new

  end
end