class ImportData < ActiveRecord::Migration
  def change
  	Rake::Task['db:data:load'].invoke	 #This doesn't work, not sure why. Had to manually call rake:db:data:load	
  end

	def self.up		
	#	Rake::Task['db:data:load'].invoke	 #This doesn't work, not sure why. Had to manually call rake:db:data:load	
	end

end
