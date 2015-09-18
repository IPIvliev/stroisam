# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://interlavka.su"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

  add '/about.html', :changefreq => 'monthly', :priority => 1.0

  Article.where("view = true").find_each do |article|
    add category_article_path(article.category, article), :lastmod => article.updated_at, :changefreq => 'weekly', :priority => 1.0
  end

  add '/contacts.html', :priority => 0.3, :changefreq => 'yearly'
end
