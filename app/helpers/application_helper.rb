module ApplicationHelper
  
  #A handy helper to return the full title on a per-page basis
  def full_title(page_title)
    base_title = ENV['comp_title']
    if page_title.empty?
      base_title 
    else
      "#{base_title} | #{page_title}"
    end
  end
end
