class FriendsController < ApplicationController
    
    def follow
        friend = get
        if !friend.nil?
            friend.destroy
            redirect_to(root_path)
        else
            newFriend = Friend.new
            newFriend.user = current_user
            newFriend.friend_id = params[:friend_id]
            if newFriend.save!
                redirect_to(root_path)
            end
        end
    end

    def get
        @friend = Friend.find_by(friend_id: params[:friend_id], user_id: current_user.id)
    end

end
