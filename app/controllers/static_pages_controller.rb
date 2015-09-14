class StaticPagesController < ApplicationController
  def index
  	@articles = Article.order("created_at DESC")
  end

  def contacts
  	add_breadcrumb "Контакты", "/contacts.html"
  end

  def about
  	add_breadcrumb "О проекте", "/about.html"
  end
end
