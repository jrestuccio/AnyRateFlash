class ImportTfxData < ActiveRecord::Migration
  def change

  	execute "SET SESSION sql_mode = 'NO_AUTO_VALUE_ON_ZERO';"
  	execute "SET FOREIGN_KEY_CHECKS=0;"

  	Rake::Task['db:data:load'].invoke

  	execute "SET FOREIGN_KEY_CHECKS=1;"
  end

	def self.up		
	#	Rake::Task['db:data:load'].invoke	 #This doesn't work, not sure why. Had to manually call rake:db:data:load	
	end
end
