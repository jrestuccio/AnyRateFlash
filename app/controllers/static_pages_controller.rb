class StaticPagesController < ApplicationController

  def welcome
    @user_name
    @password
  end

  def logon
  	# .select('ContactID').
  	@user = TfxContact.where(["UserID = ? and Password = ?", params[:user_name], params[:password]]).first
  	redirect_to flash_path(@user)

		  # 	@sqlcom = "SELECT 
				# 			*
				# 		FROM
				# 			TFX_Contacts
				# 		WHERE 
				# 			
				# 		
				# @item = ActiveRecord::Base.connection.execute(@sqlcom)
		  # sSQL = "SELECT * FROM TFX_Contacts WHERE UserID = '" & Request("UserID") & "' "
		  #   sSQL = sSQL & "AND Password = '" & Request("Password") & "' "

  end

  def flash
  	@userat = TfxContact.find(params[:id])

  	# 
  	@hotels = ActiveRecord::Base.connection.execute("usp_getCustomersByEmail '" + @userat.UserID "'")
  end

end
