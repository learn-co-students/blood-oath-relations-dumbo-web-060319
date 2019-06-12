
class Follower 

    attr_accessor :name, :age, :life_motto, :cult
    @@all=[]
    def initialize(name, ages)
        @name = name 
        @age = ages
        @@all << self 
    end 


    def cults 
        Bloodoath.all.select do |bo|
            if bo.follower == self 
                bo.cult 
            end
        end
    end 

    def join_cult(cult)
        newOne = Bloodoath.new(cult, self)
    end 

    def self.all 
        @@all 
    end 
    def self.of_a_certain_age(a)
        @@all.select do |b|
            b.age >= a 
        end
    end


end 