class MarioController < ActionController::Base
  def test
    Rails.configuration.mario_service.run(
      first_name: params[:first_name], 
      last_name: params[:last_name]
    )

    head :ok
  end
end
