class StaticPagesController < ApplicationController
  
  def index
    events = Event.where('start_date >= ?', Time.zone.now)
    @all_events = !events.nil? && events.count > 30 ? events.take(30) :  events
    @today_events = Event.where(start_date: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    weekend_start = Date.today.end_of_week - 1
    weekend_end   = Date.today.end_of_week
    @weeked_events = Event.where("start_date <= ? AND end_date >= ?", weekend_end, weekend_start)
    @free_events = Event.where("price < ?", 1);
    @music_events = get_by_category("music")
    @food_drink_events = get_by_category("food & drink")
    @charity_events = get_by_category("charity")
  end
  

 
  def secret
  end

  def help
  end

  def about
  end

  private
  def get_by_category(category_name)
    cat_id  = Category.where("LOWER(title) = ?", category_name.downcase).first.id
    return Event.where("category_id = ?", cat_id)
  end
end
