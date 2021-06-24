class User::SubscriptionsController < UserController

  def follow
    #@user_to_follow = User.find(params[:id])   # find  => somente ID
    user_to_follow = User.find_by(id: params[:id])  # find_by =>  parametro a escolha

    Subscription.create(followed_by: current_user, followed: user_to_follow)

    redirect_to user_potential_to_follow_path
  end

  def unfollow
    user = User.find_by(id: params[:id])

    subscriptions = Subscription.find_by(followed_by: current_user, followed: user)

    subscriptions.destroy

    redirect_to user_following_path
  end
end