require_relative './department'

class Application
  attr_accessor :eee,:mech,:cse,:civil

  def initialize
    
    
    self.eee = Department.new "EEE"

    self.mech = Department.new "MECH"
    self.cse = Department.new "CSE"
    
    self.civil = Department.new "CIVIL"

  end

  def enroll(student_name, student_department)
  
      depts=[eee,mech,cse,civil]
    info=""
      depts.each do |dept|
        if(dept.Dept_name == student_department)
             if(dept.total <6 )
                return "You have been enrolled to #{student_department}\n#{dept.enroll student_name}"
                        
              else
                   "Error: Seats are not available in #{dept.Dept_name}"
              end
        end
      end            
  end

  def change_dept(student_name, student_department)
          
          dept_list=[]
          dept_list.push(eee)
          dept_list.push(mech)
          dept_list.push(cse)
          dept_list.push(civil)

          dept_list.each do |dept|
                  
                           dept_list.each do |city|

                              sec=city.sec_List
                                 sec.each do |a|
                                    b=a.student_list.delete(student_name)
                                    if(b != nil)
                                    a.student_list.sort()
                                  #  return  enroll(student_name, student_department)
                                 
                                  end
                                 end
                           end            
                             return  enroll(student_name, student_department)
          end               
  end

  def change_section(student_name, section)
        flag = 0
        dept_list=[eee,mech,cse,civil]
        dept_list.each do |dept|
           dept.sec_List.each do |sec|
              sec.student_list.each do |stu|
                  if(stu == student_name)
                    
                       sec.student_list.delete(student_name)
                       sec.student_list.sort()
                       flag = dept.Dept_name
                       
                  end
              end
           end
        end
            dept_list.each do |dept|
                  dept.sec_List.each do |sec|
                         if(section == sec.name && dept.Dept_name == flag)
                               sec.student_list.push(student_name)
                               sec.student_list.sort();
                               str="You have been allotted section #{section}"
                                return "#{str}\nYour roll number is #{dept.Dept_name}#{section}#{0}#{sec.student_list.index(student_name)+1}"
                                  
                          end
                  end
            end                          
  end

  def department_view(student_dept)
            a = 0
            if(student_dept == "EEE")
                a=eee;
            elsif(student_dept == "MECH")
                a=mech;
            elsif(student_dept == "CSE")
                a=cse;
            elsif(student_dept == "CIVIL")
                   a=civil;
            end

      str = "List of students:"
      a.sec_List.each do |s|
        s.student_list.each do |stu|
          str+="\n#{stu} - #{student_dept}#{s.name}#{0}#{s.student_list.index(stu)+1}"
        end
      end  
      return str
   
  end

  def section_view(student_dept, section)
    str = "List of students:"
          a = 0
            if(student_dept == "EEE")
                a=eee;
            elsif(student_dept == "MECH")
                a=mech;
            elsif(student_dept == "CSE")
                a=cse;
            elsif(student_dept == "CIVIL")
                   a=civil;
            end
        b=""
      a.sec_List.each do |sec|
        if(sec.name == section)
          b=sec
          sec.student_list.each do |stu|
           
            str+="\n#{stu} - #{student_dept}#{section}#{0}#{sec.student_list.index(stu) + 1}"
          end  
        end
      end 
       return str
  end

  def student_details(student_name)
   
    depts=[eee,mech,cse,civil]
     depts.each do |dept| 
          dept.sec_List.each do |sec|
            sec.student_list.each do |stu|
               if(stu == student_name)
                   return "#{student_name} - #{dept.Dept_name} - Section #{sec.name} - #{dept.Dept_name}#{sec.name}0#{sec.student_list.index(student_name)+1}"
               end
            end
          end
     end     
  end        
end
