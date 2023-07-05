class Trip

    def initialize(d:, n:, f:, c:)
        @distance = d
        @nuts = n
        @fuel = f # / km
        @capacity = c
    end

    def carryable
        [ @nuts, @capacity ].min
    end 

    def total_fuel_required 
        @fuel * @distance
    end

    def doable?
        total_fuel_required < carryable
    end

    def nuts_at_destination
        carryable - total_fuel_required
    end

    def trips_required
        @nuts / carryable
    end
end