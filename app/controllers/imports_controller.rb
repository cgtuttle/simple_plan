class ImportsController < ApplicationController
	include ApplicationHelper
	include ImportsHelper
	before_filter { |c| c.set_zone "Application" }
	
	def new
	end
	
	def create
		if params[:import_file]=='Continue'
			@import = Import.new
			@import.account_id = current_account.id
			@import.user_id = current_user.id
			@import.first_row = 1
			@import.model = params[:model]
			@import.save
			import_file
			@model = params[:model]
			field_choices
			logger.debug "edit -> @field_choices = #{@field_choices.inspect}"
			render 'edit'
		end
	end
	
	def edit
		@import = Import.find(params[:import])
	end
	
	
	
	
end
