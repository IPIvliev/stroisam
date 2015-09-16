class StaticPagesController < ApplicationController
  def index
  	@articles = Article.where("view = ?", true).order("created_at DESC").limit(6)
  end

  def contacts
  	add_breadcrumb "Контакты", "/contacts.html"
  end

  def about
  	add_breadcrumb "О проекте", "/about.html"
  end
end
