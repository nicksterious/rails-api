require "rails_helper"

RSpec.describe Trip, type: :model do

    describe "methods" do
        subject {
            Trip.new(d: 0, n: 0, f: 0, c: 0)
        }
        it { should respond_to :total_fuel_required }
        it { should respond_to :doable? }
        it { should respond_to :carryable }
        it { should respond_to :nuts_at_destination }
    end

    describe "behaviour" do

        describe "trips_required" do
            subject {
                Trip.new(d: 50, n: 500, f: 1, c: 100)
            }
            it "calculates trips required" do
                expect(subject.trips_required).to eq 5
            end

        end

        describe "nuts_at_destination" do
            subject {
                Trip.new(d: 5, n: 55, f: 3, c: 25)
            }
            it "outputs cargo - fuel" do
                expect(subject.nuts_at_destination).to eq 10
            end
        end

        describe "doable" do
            context "enough nuts in cargo to cover for fuel" do
                subject{ 
                    Trip.new(d: 5, n: 25, f: 3, c: 25)
                }
                it "should return false" do
                    expect(subject.doable?).to eq true
                end
            end

            context "not enough nuts for trip" do
                subject{ 
                    Trip.new(d: 15, n: 10, f: 3, c: 25)
                }
                it "should return false" do
                    expect(subject.doable?).to eq false
                end
            end
        end

        describe "total_fuel_required" do
            subject {
                Trip.new(d: 15, n: 100, f: 3, c: 25)
            }
            it "calculates fuel requirement" do
                expect(subject.total_fuel_required).to eq 15*3
            end
        end


        describe "carryable" do
            context " nuts > capacity" do
                subject {
                    Trip.new(d:12, n:50, f: 1, c: 25)
                }
                it "should pick capacity" do
                    expect(subject.carryable).to eq 25
                end
            end
            context "nuts < capacity" do
                subject {
                    Trip.new(d:12, n:15, f: 1, c: 25)
                }
                it "should pick nuts" do
                    expect(subject.carryable).to eq 15
                end
            end
        end
    end


    # Trip.new(d:, n:, f:, c: )
end