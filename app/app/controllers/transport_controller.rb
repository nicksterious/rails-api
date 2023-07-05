class TransportController < ApplicationController

    def create
        input = params[:_json]
            .collect{ |line| line.split(",") }
            .select{ |line| line.size == 4 }
            .collect{ |values|
                d, n, f, c = values.map(&:to_i)
                {
                    d: d,
                    n: n,
                    f: f,
                    c: c
                }
            }
        
        trips = input.collect{ |i|
            trip = Trip.new(**i)
            {
                input: i,
                doable: trip.doable?,
                result: trip.nuts_at_destination,
                trips_required: trip.trips_required
            }
        }
        
        render json: trips
    end # create

end