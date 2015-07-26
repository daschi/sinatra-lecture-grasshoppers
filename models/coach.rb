class Coach
	@@list = ['John', 'Jason']

	def self.all 
		@@list
	end

	def self.create(name)
		@@list << name 
	end

	def self.delete(name)
		@@list.delete(name)
	end
	
end