class API::V1::TripsController < ApplicationController
  before_action :doorkeeper_authorize!, only: :mine

  def index
    @trips = []
    100.times do |i|
      @trips << {
        name: "trip_#{i}",
        code: SecureRandom.hex(10)
      }
    end
  end

  def mine
    @mine = {
      name: "kaka",
      code: SecureRandom.hex(10)
    }
  end
end
