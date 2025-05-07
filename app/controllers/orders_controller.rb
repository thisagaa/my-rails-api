class OrdersController < ApplicationController
  def index
    orders = Order.page(params[:page]).per(10)
    render json: orders
  end

  def show
     order = Order.find(params[:id])
     render json: order
  end

  def create
    order = Order.new(order_params)
    if order.save
      render json: order, status: :created
    else
      render json: { errors: order.errors }, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :status, :total_price)
  end
  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      render json: order
    else
      render json: { errors: order.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    render json: { message: "Order deleted" }
  end
end

class OrdersController < ApplicationController
  before_action :set_cors_headers

  def index
    orders = Order.all
    render json: orders
  end

  private

  def set_cors_headers
    response.set_header("Access-Control-Allow-Origin", "*")
    response.set_header("Access-Control-Allow-Methods", "GET, POST, PATCH, DELETE, OPTIONS")
    response.set_header("Access-Control-Allow-Headers", "Content-Type, Authorization")
  end
end
