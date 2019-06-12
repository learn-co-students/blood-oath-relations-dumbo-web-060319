
class Cult 

    @@all=[]
    attr_accessor :name, :location, :founding_year, :slogan
    def initialize(name)
        @name = name 
        @@all << self 
    end
    def recruit_follower(follow) 
        newOne = Bloodoath.new(self, follow)

    end
    def cult_population
        count = 0 
        Bloodoath.all.each do |bo|
            if bo.cult == self 
                count = count + 1
            end
        end
        return count 
    end
    def self.all 
        @@all 
    end
    def self.find_by_name(cult)
        Bloodoath.all.each do |bo|
            if bo.cult == self 
                return bo.cult 
            end
        end
    end 
    def self.find_by_location(loc)
        @@all.select do |c|
            c.location == loc 
        end
    end 
    def self.find_by_founding_year(year)
        @@all.select do |c|
            c.founding_year == year 
        end
    end 




end 