module ApplicationHelper
# Return a title on a per-page basis.
  def title
    base_title = "Simple Plan"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
	
	
	def logo
		logo = image_tag("SimplePlan.png", :alt => "Plan Well!")
	end
	
	def simple_flowchart
		simple_flowchart = image_tag("SimplePlan_Flowchart.png", :alt => "Simplify your process!")
	end
	
	
end
