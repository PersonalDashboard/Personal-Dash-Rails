class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    redirect_to dashboard_path(current_user.dashboards.first)
  end

  def show
    mechanize = Mechanize.new
    @dashboard = Dashboard.find(params[:id])
    @imgur_cat = mechanize.get("https://imgur.com/r/cats")
    @imgur_dog = mechanize.get("https://imgur.com/r/dogs")
    @imgur_meme = mechanize.get("https://imgur.com/r/memes")
    @imgur_pun = mechanize.get("https://imgur.com/r/puns")
    @reddit_ruby = mechanize.get("http://reddit.com/r/ruby")
    @cat = @imgur_cat.search("//div[@class='posts sub-gallery br5 first-child']").xpath('/html/body/div[7]/div[2]/div[1]/div[1]/div[1]/a/img')[0].attributes['src'].value

    @cat = @imgur_cat.search("//div[@class='posts sub-gallery br5 first-child']").xpath('/html/body/div[7]/div[2]/div[1]/div[1]/div[1]/a/img')[0].attributes['src'].value
    @dog = @imgur_dog.search("//div[@class='posts sub-gallery br5 first-child']").xpath('/html/body/div[7]/div[2]/div[1]/div[1]/div[1]/a/img')[0].attributes['src'].value
    @meme = @imgur_meme.search("//div[@class='posts sub-gallery br5 first-child']").xpath('/html/body/div[7]/div[2]/div[1]/div[1]/div[1]/a/img')[0].attributes['src'].value
    @pun = @imgur_pun.search("//div[@class='posts sub-gallery br5 first-child']").xpath('/html/body/div[7]/div[2]/div[1]/div[1]/div[1]/a/img')[0].attributes['src'].value
    @ruby_online = @reddit_ruby.search("//p[@class='users-online']")[0].children[0].children[0].text
    @ruby_subscribed = @reddit_ruby.search("//span[@class='subscribers']")[0].children[0].children[0].text
  end
end
