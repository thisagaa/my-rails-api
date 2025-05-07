class WelcomeController < ApplicationController
  def index
    render json: { message: "Hello, World! " }
  end

  def test
    render json: { message: "okay" }
  end
end
