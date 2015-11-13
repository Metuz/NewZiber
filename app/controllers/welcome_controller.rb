class WelcomeController < ApplicationController
  def home
    @brands = Brand.all
  end
  def about
  end
end
