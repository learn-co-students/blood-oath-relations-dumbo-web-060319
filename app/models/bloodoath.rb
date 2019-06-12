class Bloodoath 
    attr_accessor :cult, :follower, :initiation_date 

    @@all = []

    def initialize(cult, follower)
        @cult = cult 
        @follower = follower 
        @initiation_date = " #{Time.now.year}-#{Time.now.month}-#{Time.now.day}"

        @@all << self
    end

    def self.all 
        @@all
    end

    def self.first_oath 
        sorted = @@all.sort_by { |bloodoath| bloodoath.initiation_date }
        sorted[0]
    end

end