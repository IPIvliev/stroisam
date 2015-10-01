class StaticPagesController < ApplicationController
  def index
  	@articles = Article.where("view = ?", true).order("created_at DESC").limit(6)

    set_meta_tags :title => "Строительные коммуникации",
      :description => "Портал о строительстве и строительных коммуникациях. Сборник практических советов по самостоятельному строительству",
      :keywords => "строительство, строительные коммуникации, пластиковые окна, строй сам, водоотведение, водоснабжение дома, отопление частного дома, электричество в доме, тёплый пол в квартире"
  end

  def contacts
  	add_breadcrumb "Контакты", "/contacts.html"

    set_meta_tags :title => "Контакты",
      :description => "Связаться с администратором сайта",
      :keywords => "связь, строительство, реклама в строительстве"  	
  end

  def about
  	add_breadcrumb "О проекте", "/about.html"

    set_meta_tags :title => "О проекте",
      :description => "Информация о проекте Строй Сам",
      :keywords => "строительный портал, строительство, строительный сайт, информация о стройке, советы по стройке"
  end
end
