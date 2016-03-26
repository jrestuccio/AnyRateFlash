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
  end

  def flashRefineSearchRateTypes
    # phash2 = phash
    @rateTypes = ActiveRecord::Base.connection.execute("CALL usp_GetFlashRateTypes")
    # @rateFilters = ActiveRecord::Base.connection.execute("CALL usp_GetFlashRateFilters")
  end

  # Still an issue with retriving the hash
  def flashRefineSearch
    @userat = TfxContact.find(params[:id])
    # phash3 = phash2

    #@show_hotels = [1,2]  # ActiveRecord::Base.connection.execute("call usp_GetFlashHotelsForCustomer('" + @phash[:CustomerID] + "')")
    
    #@show_sites = [1,2] # ActiveRecord::Base.connection.execute("call usp_GetFlashSitesForCustomer('" + @phash[:CustomerID] + "')")
    @show_hotels = ActiveRecord::Base.connection.execute("CALL usp_GetFlashHotelsForCustomer('"+params[:CustomerID]+"')").to_a
    # query = ActiveRecord::Base.connection.prepare("CALL usp_GetFlashHotelsForCustomer(?)")
    # @show_hotels = query.execute(params[:CustomerID].to_i).to_a
    ActiveRecord::Base.clear_active_connections!
    #params[:show_sites][:siteid,:sitedesc,:isbranded,:searchtypeid,:havedetailedrates,:isavailable,:isactive] || = []
    show_sites_temp = ActiveRecord::Base.connection.execute("CALL usp_GetFlashSitesForCustomer(3224)")
    branded = show_sites_temp.select{ |s| s[1] == 1}
    @show_sites = show_sites_temp.select{ |s| s[1] == 0} 
    @show_sites = @show_sites.map{ |s| s[0][2..-1].tr('/ ','_')}
    @show_sites << 'Branded'


    # currently only a copy of the hotels array
    @show_compsets =  [] 
    @show_hotels.each{ |item|  @show_compsets.push(item.to_a.dup)}
    # @show_compsets = @show_hotels.dup 

  end

  def flashRefineSearchSchedule
      @timeTable = ['5:00AM (CST)', '6:00AM (CST)', '7:00AM (CST)','8:00AM (CST)']
  end

end
