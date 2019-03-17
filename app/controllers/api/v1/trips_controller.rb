class API::V1::TripsController < API::BaseController
  before_action :doorkeeper_authorize!, only: :mine

  def index
    @trips = []
    10.times do |i|
      @trips << {
        name: "trip_#{i}",
        code: SecureRandom.hex(10)
      }
    end

    render_success(message: 'List trip')
  end

  def mine
    @mine = {
      name: "kaka",
      code: SecureRandom.hex(10)
    }

    render_success(message: 'Your trips')
  end
end
