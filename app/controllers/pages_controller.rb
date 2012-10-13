class PagesController < ApplicationController
  def home
    @title = 'Home'
  end

  def mypage
    @title = 'My Page'
  end

  def upload
    @title = 'Upload'
  end

  def register
    @title = 'Register'
  end

  def login
    @title = 'Login'
  end
end
