class Instructor

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end


    def pass_student(student, test_name)
        BoatingTest.all.each do |x|
            if x.test_name == test_name
                if x.student == student
                    x.test_status = "passed"
                    return x
                end
            else
                BoatingTest.new(student, test_name, "passed", self)
            end
        end
    end

    def fail_student(student, test_name)
        BoatingTest.all.each do |x|
            if x.test_name == test_name
                if x.student == student
                    x.test_status = "failed"
                    return x
                end
            else
                BoatingTest.new(student, test_name, "failed", self)
            end
        end
    end

    def self.all
        @@all
    end
end
