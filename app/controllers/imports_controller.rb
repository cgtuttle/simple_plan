class ImportsController < ApplicationController
	include ApplicationHelper
	include ImportsHelper
	before_filter { |c| c.set_zone "Application" }
	
	def new
		@import = Import.new
	end
	
	def create
		if params[:file]
			if params[:import_file]=='Continue'
				@import = Import.new(params[:import])
				@import.account_id = current_account.id
				@import.user_id = current_user.id
				@model = @import.model
				@import.save
				import_file			
				field_choices
				render 'edit'
				logger.debug "create -> @row_count = #{@row_count}"
			end
		else
			redirect_to new_import_path
		end
	end
	
	def edit
		@import = Import.find(params[:import])
	end
	
	def update
		@import = Import.find(params[:id])
		@first_row = params[:first_row]
		@row_count = params[:row_count]
		@field_choices = params[:field_choices]
		@import.first_row = @first_row
		@import.row_count = @row_count
		@import.cells.each do |cell|
			if cell.column <= @field_choices.length && cell.row >= params[:import][:first_row].to_i
				cell.destination = @field_choices[cell.column-1]
			end		
		end
		if @import.update_attributes(params[:import])
			save_import
			flash[:success] = "Import completed successfully."
		end
		@controller = @import.model.pluralize.downcase
		redirect_to :action => :index, :controller => @controller
	end
	
	
end
