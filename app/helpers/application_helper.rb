module ApplicationHelper
# Returns the full title on a per-page basis.
  def full_title(page_title)
  #def title    
    base_title = "Learning Counsel"
    if page_title.empty?
    #if @title.empty?      
      base_title
    else
      "#{base_title} | #{page_title}"
      #"#{base_title} | #{@title}"      
    end
  end    
  
  # def sortable(column, title = nil)
    # title ||= column.titleize
    # css_class = column == sort_column ? "current #{sort_direction}" : nil
    # direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    # link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  # end
  
end