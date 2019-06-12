class Cult 
    attr_reader :name, :location, :founding_year, :slogan 
    
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name 
        @location = location 
        @founding_year = founding_year 
        @slogan = slogan 

        @@all << self
    end

    # def recruit_follower(follower)
    #     Bloodath.new(self, follower)
    # end
    
    def recruit_follower(follower)
        follower.age > minimum_age ? Bloodath.new(self, follower) : "Sorry, your'e too young"
    end

    def bloodoaths 
        Bloodoath.all.select { |bloodoath| bloodoath.cult == self }
    end

    def followers 
        bloodoaths.map { |bloodoath| bloodoath.follower }
    end

    def cult_population 
        self.followers.length
    end

    def average_age 
        total_age = 0 
        followers.each { |follower| total_age += follower.age } 
        total_age / (follower.size * 1.0)
    end

    def my_followers_mottos 
        followers.map { |follower| follower.motto }
    end

    def minimum_age(minimum_age)
        @minimum_age = minimum_age
    end



    def self.all 
        @@all 
    end

    def self.find_by_name(name) 
        @@all.find { |cult| cult.name == name }
    end

    def self.find_by_location(location)
        @@all.select { |cult| cult.location == location }
    end

    def self.find_by_founding_year(year)
        @@all.select { |cult| cult.founding_year == year }
    end

    def self.least_popular 
        least_popular = @@all[0]
        @@all.each do |cult|
            if cult.followers.length < least_popular.followers.length 
                least_popular = cult 
            end
        end
        least_popular
    end

    def self.most_common_location 
        location_count_hash = Hash.new(0)
        @@all.each { |cult| location_count_hash[cult.location] += 1 }
        location_count_hash.max_by { |location, count| count}[0]
    end



end