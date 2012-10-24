class FriendshipsController < ApplicationController
	def create
		@friendship = current_user.friendships.new(:friend_id => params[:friend_id])
		if @friendship.save
			flash[:notice] = "Friendship request sent :)"
			redirect_back_or mypage_path
		else
			flash[:notice] = "Error sending the request :("
			redirect_back_or mypage_path
		end
	end

	def destroy
		@friendship = Friendship.find(params[:id])
		@friendship2 = Friendship.where(:user_id => @friendship.friend_id).where(:friend_id => @friendship.user_id).first

		if @friendship2
			@friendship2.destroy
		end
		if @friendship
			@friendship.destroy
		end


		flash[:notice] = "Removed Friendship"
		redirect_to mypage_path
	end
end

