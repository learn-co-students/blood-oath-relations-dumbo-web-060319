class Follower
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age 
        @life_motto = life_motto 

        @@all << self 
    end

    # def join_cult(cult)
    #     Bloodoath.new(cult, self)
    # end

    def join_cult(cult)
        self.age > cult.minimum_age ? Bloodath.new(cult, self) : "Sorry, your'e too young"
    end

    def bloodoaths
        Bloodoath.all.select { |bloodoath| bloodoath.follower == self }
    end

    def cults
        bloodoaths.map { |bloodoath| bloodoath.cult }
    end

    def my_cult_slogans 
        cults.each { |cult| puts cult.slogan }
    end

    # def fellow_cult_members
        
    # end



    def self.all 
        @@all 
    end

    def self.of_a_certain_age(age)
        self.all.select { |follower| follower.age == age }
    end

    def self.most_active 
        most_active = @@all[0]
        @@all.each do |follower| 
            if follower.cults.length > most_active.cults.length 
                most_active = follower 
            end
        end
        most_active
    end

    def self.top_ten 
        sorted = @@all.sort_by { |follower| follower.cults.length }
        sorted.last(10)
    end




end