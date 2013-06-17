module ApplicationHelper
  def date_to_s(date) 
    date.strftime("%B %d, %Y %I:%M %p") 
  end
end
