module ApplicationHelper
  def full_title(page_title)
    base_title = "Greendrivers"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

   def sortable(column, title = nil) #CODE COMMENTS NEEDED
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil 
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end



