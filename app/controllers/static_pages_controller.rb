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
				# 			m.User_ID = " + current_user.id.to_s + "
				# 			AND (p.User_ID is null  OR p.User_ID = " + current_user.id.to_s + ")
				# 		GROUP BY
				# 			i.description,
				# 			i.unit_of_measure,
				# 			p.quantity
				# 		HAVING
				# 			SUM(ci.quantity) > CASE WHEN p.quantity is null THEN 0 ELSE p.quantity END"
				# @grocery = ActiveRecord::Base.connection.execute(@sql)
		  # 	sSQL = "SELECT * FROM TFX_Contacts WHERE UserID = '" & Request("UserID") & "' "
		  #   sSQL = sSQL & "AND Password = '" & Request("Password") & "' "

  end

  def flash
  	@userat = TfxContact.find(params[:id])
  end

end
