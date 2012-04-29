class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:fb_auth]

  def index
  end

  def fb_auth
    auth = FbGraph::Auth.new(Facebook.config[:client_id], Facebook.config[:client_secret])
    auth.from_cookie(cookies) # Put whole cookie object (a Hash) here.
    fb_user = auth.user.fetch

    are_friends=false
    fb_user.friends.each do |friend|
      if FB_OWNER_IDS.include? friend.identifier
        are_friends=true
        break
      end
    end

    if are_friends

      if user = User.find_by_email(fb_user.email)
        env['warden'].set_user(user)
      else # Create a user with a stub password.
        user = User.create(:email => fb_user.email, :password => Devise.friendly_token[0,20])
        user.save(:validate => false)
        env['warden'].set_user(user)
      end
    end

    redirect_to root_url
  end
end
