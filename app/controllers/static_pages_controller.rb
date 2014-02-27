require 'open-uri'
class StaticPagesController < ApplicationController
  def home
  	@links = []
  	@articles = []
  	agent = Mechanize.new
    page = agent.get("http://edition.cnn.com/?refresh=1")
    page.search("//div[@id='cnn_maintt2bul']/div/div/ul/li[count(*)=3]/a")[0, 5].map{|a| page.uri.merge a[:href]}.each do |uri| 
    article = agent.get(uri).parser
    @links << uri
    @articles << article.css(".adtag15090+ p").text
    end
   end
end
