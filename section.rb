class Section
  attr_accessor :student_list,:num,:name
	def initialize(name)
		@name=name
  		self.student_list = []
  		self.num = 0;
	end
	def add(student_name)
       @student_list.push(student_name)     
       @num+=1
     @student_list = @student_list.sort { |a, b| a <=> b }
      return (@student_list.index(student_name) + 1)

     end
end