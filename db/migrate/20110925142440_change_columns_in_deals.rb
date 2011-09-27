class ChangeColumnsInDeals < ActiveRecord::Migration
	change_table :deals do |t|
		t.remove	:category_id
		t.remove	:code
		t.remove	:name
		t.remove	:descr
		t.string	:status
		t.date		:offered_on
		t.date		:accepted_on
		t.string	:offered_to
		t.string	:accepted_by
		t.text		:notes
	end
end
