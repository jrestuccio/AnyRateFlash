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
   
  	# @hotels = hquery.fetch_all
    # @phash = params.dup
  end
  
  def continue 
    # @phash = params.dup
     @phash = { "days_selected" => params[:selected_days],
      "cust_name" => params[:CustomerName],
      "cust_id" => params[:CustomerID],
      "s_date" => params[:start_date],
      "e_date" => params[:end_date]            
    }
    redirect_to flashRefineSearchRateTypes_path(@phash)      
  end


  def flashRefineSearchRateTypes
    # phash2 = phash
    @rateTypes = ActiveRecord::Base.connection.execute("CALL usp_GetFlashRateTypes")
  end

  def continue2 
    # phash = params.clone   
    redirect_to flashRefineSearch_path()      
  end

  # Still an issue with retriving the hash
  def flashRefineSearch
    # phash3 = phash2


    @show_hotels = [1,2]  # ActiveRecord::Base.connection.execute("call usp_GetFlashHotelsForCustomer('" + @phash[:CustomerID] + "')")

    @show_sites = [1,2] # ActiveRecord::Base.connection.execute("call usp_GetFlashSitesForCustomer('" + @phash[:CustomerID] + "')")
  end

  def continue3

  end

end
