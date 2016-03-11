class StaticPagesController < ApplicationController

  def welcome
    @user_name
    @password
  end

  def logon
  	# .select('ContactID').
  	@user = TfxContact.where(["UserID = ? and Password = ?", params[:user_name], params[:password]]).first
  	redirect_to flash_path(@user)

  end



  def flash
  	@userat = TfxContact.find(params[:id])

  	# used to get the hotels
  	@hotels = ActiveRecord::Base.connection.execute("call usp_getCustomersByEmail('" + @userat.UserID + "')")

  	@arr_days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "EveryDay"]
  
    # pulling params from the page
    # days_selected = params[:selected_days]
    # cust_name = params[:CustomerName]
    # cust_id = params[:CustomerID]
    # s_date = params[:start_date]
    # e_date = params[:end_date]
  	# @hotels = hquery.fetch_all
  end
  
  def continue 
    phash = params.clone   
    redirect_to flashRefineSearchRateTypes_path(phash)      
  end


  def flashRefineSearchRateTypes
    @rateTypes = ActiveRecord::Base.connection.execute("CALL usp_GetFlashRateTypes")
  end

  def continue2 
    phash = params.clone   
    redirect_to flashRefineSearch_path(phash)      
  end

  def flashRefineSearch

  end

  def continue3

  end

end
