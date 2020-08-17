class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  
  def index
    events = Event.where('start_date >= ? AND is_publish = ? AND validated = ?', Time.zone.now, true, true).order(start_date: :asc)
    @all_events = events.paginate(page: params[:page], per_page: 20)
    @today_events = events.where(start_date: Time.zone.now..Time.zone.now.end_of_day)
    weekend_start = Date.today.end_of_week - 1
    weekend_end   = Date.today.end_of_week
    @weeked_events = events.where("start_date <= ? AND end_date >= ?", weekend_end, weekend_start)
    @free_events = events.where("price < ? AND start_date >= ?", 1, Time.zone.now);
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
    cat_id  = Category.where("LOWER(title) = ? ", category_name.downcase).first.id
    return Event.where("category_id = ? AND start_date >= ? AND is_publish = ?", cat_id, Time.zone.now, true)
  end
end
