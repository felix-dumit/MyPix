class PagesController < ApplicationController
  def home

	@images = Image.find(:all, :order => "created_at", :limit => 9).reverse
  end

  def mypage
  end

  def upload
  end

  def register
  end

  def login
  end
end
