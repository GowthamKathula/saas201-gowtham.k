require_relative './section'

class Department
  	attr_accessor :a,:b,:c,:total,:dept,:Dept_name
	def initialize(name)
  		self.a = Section.new("A")
  		self.b = Section.new("B")
  		self.c = Section.new ("C")
  		self.total = 0
  		@Dept_name = name
  		
	end
	def enroll(student_name)
		roll = 0
       	suc = 0
     	 if a.num<2
        	  roll = a.add(student_name)
           		suc = 'A'
          
      	elsif b.num<2
          suc = 'B'
 		 roll = b.add(student_name)
         
      	elsif c.num<2
         suc = 'C'
         roll = c.add(student_name)
#        
      	end
      	@total+=1;
     return "You have been allotted section #{suc}" \
    "\nYour roll number is #{@Dept_name}#{suc}#{0}#{roll}"
	end



	def sec_List

		sec_list=[]
		sec_list.push(@a)
		sec_list.push(@b)
		sec_list.push(@c)
		return sec_list
	end	

end

























