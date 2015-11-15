class WelcomeController < ApplicationController
  def home
    @brands = Brand.all
  end
  def about
  end
  def service
  end
  def faq
  end
end
