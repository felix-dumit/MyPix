class PagesController < ApplicationController
  def home
	@images = Image.last(9).reverse
  @urls = ['http://mypix.herokuapp.com', 'http://cits4230c.csse.uwa.edu.au/mypix']
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
