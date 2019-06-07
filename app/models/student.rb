class Student

    attr_reader :first_name

    @@all = []
    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def self.find_student(first_name)
        Student.all.find do |student|
            student.first_name == first_name
        end
    end

    def grade_percentage
        array = BoatingTest.all.map do |x|
            if x.student == self
                x.test_status
            end
        end
        trim = array.select{ |x| x }
        dec = trim.count("passed").to_f / trim.length.to_f
        dec * 100
        #binding.pry


    end


    def self.all
        @@all
    end

end
