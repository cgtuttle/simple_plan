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
	
	def currency_two(number)
		number_to_currency(number, :separator => ".", :delimiter => ",", :precision => 2)
	end
	
	def float_zero(number)
		number_with_precision(number, :delimiter => ",", :precision => 0)
	end
	
	def logo
		logo = image_tag("SimplePlan Logo 15px.png", :alt => "Plan Well!")
	end
	
	def simple_flowchart
		simple_flowchart = image_tag("SimplePlan_Flowchart.png", :alt => "Simplify your process!")
	end
	
	def current_account
		current_user.account
	end
	
	def current_partners
		#Account.find(:all, :conditions => ["id IN (SELECT partner_id FROM partnerships WHERE account_id = ?)", current_account])
		current_account.partners
	end
	
	def current_customers(user)
		Account.find(:all, :conditions => {:service => 'customer', :id => current_partners})
	end
	
	def current_products
		Product.find(:all, :conditions => ["account_id IN (?) or account_id = ?", current_partners, current_account])
	end
	
	def current_activities
		Activity.find(:all, :conditions => ["account_id IN (?) OR account_id = ?", current_partners, current_account])
	end
	
	
end
