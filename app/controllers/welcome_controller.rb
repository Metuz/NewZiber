class WelcomeController < ApplicationController
  def home
    @brands = Brand.all
    @page = Page.first
  end
  def about
  end
  def service
  end
  def faq
  end
end
