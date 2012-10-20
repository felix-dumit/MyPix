module FriendshipsHelper
    @count_friends = 0
    def friend_count user
            @count_friends=0
            user.friends.each do |friend|
                if friend.friends.include? user
                    @count_friends = @count_friends + 1
                end
            end
            @count_friends
    end


    def received_requests user
        (user.inverse_friendships.count) - (friend_count user)
    end

    def sent_requests user
        (user.friendships.count) - (friend_count user)
    end

    def friends? f
        (f.friends.include? current_user) and (current_user.friends.include? f)
    end

    def sent_request_pending? user
        current_user? user


    end

end
