class WelcomeController < ApplicationController
  def home
    @brands = Brand.all
    @page = Page.first
  end
  def about
    @page = Page.first
  end
  def service
    @page = Page.first
  end
  def faq
    @page = Page.first
    @questions = Question.all
  end
end
