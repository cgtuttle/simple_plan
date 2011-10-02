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
	
	def currency_zero(number)
		number_to_currency(number, :separator => ".", :delimiter => ",", :precision => 0)
	end
	
	def float_zero(number)
		number_with_precision(number, :delimiter => ",", :precision => 0)
	end
	
	def logo
		logo = image_tag("SimplePlan.png", :alt => "Plan Well!")
	end
	
	def simple_flowchart
		simple_flowchart = image_tag("SimplePlan_Flowchart.png", :alt => "Simplify your process!")
	end
	
	def current_account
		current_user.account
	end
	
	def current_partners
		Account.find(:all, :conditions => ["id IN (SELECT partner_id FROM partnerships WHERE account_id = ?)", current_account])
	end
	
	def current_programs
		@programs
	end
	
end
