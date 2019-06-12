
class Bloodoath

    attr_accessor :all, :cult, :follower
    @@all = []

    def initialize(cult, follower)
        @time = Time.now
        @cult = cult 
        @follower = follower 
        @@all << self 
    end 

    def initiation_date
        a = time.split(" ")
        return a[0]
    end 

    def self.all 
        @@all
    end 
end 