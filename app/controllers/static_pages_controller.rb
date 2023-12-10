class StaticPagesController < ApplicationController
  def about
    @about_page = StaticPage.find_by(title: "About Us")
  end

  def contactus
    @contact_page = StaticPage.find_by(title: "Contact Us")
  end
end
