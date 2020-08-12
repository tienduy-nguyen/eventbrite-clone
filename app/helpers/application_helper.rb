module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end
  
  def flash_class(level)
    case level
        when "notice"
          return "alert alert-info"
        when "success"
          return "alert alert-success"
        when "error" 
          return "alert alert-danger"
        when "warning" 
          return "alert alert-warning"
        when "alert"
          return "alert alert-danger"
    end
  end

  def get_time(time_utc)
    return time_utc.strftime("%Y-%m-%d %k:%M:%S")
  end
  def get_time_verbose(time_utc)
    return time_utc.strftime("%B %d,%Y at %k:%M:%p")
  end

  def is_current_user?(user)
    if logged_in?  
      return current_user.id == user.id
    end
  end

  def get_city_from_address(address)
    begin
      return address.split(',')[-2..-1][0].strip
    rescue => exception
      return "Unknown"
    end
  end

  def url_contains_account_settings?
    url = request.path_info
    return url.include?('accountsettings')
  end

  #----------------------------------#
  # Using devise form in another page
  def resource_name
    :user
  end

  def resource
    @resource ||= current_user
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def get_attendees_by_eventid(event_id)
    @attendees =[]
    attendances = Attendance.where(event_id: event_id)
    if !attendances.nil?
      begin
        attendances.each do |att|
          if !@attendees.include?(att.attendee)
            @attendees.push(att.attendee)
          end
        end
      rescue => exception
        if attendances.count  = 1
          @attendees.push(attendances.attendee)
        end
      end
    end
    return @attendees
  end


end
