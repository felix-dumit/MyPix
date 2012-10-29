module UsersHelper

    # Returns the Gravatar (http://gravatar.com/) for the given user.
    def gravatar_for(user,size=50)
        if has_avatar? user
            image_tag(user.avatar.url(:thumb), alt: user.name, class: "gravatar", width: 50)

        else
            email=user.email.to_s+""

            gravatar_id = Digest::MD5::hexdigest(email.downcase)
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
            image_tag(gravatar_url, alt: user.name, class: "gravatar", width: 50)
        end
    end

    def has_avatar? user
        user.avatar_file_name != nil
    end
end
