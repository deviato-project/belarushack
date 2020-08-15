class OrdersController < ApplicationController
   skip_before_action :verify_authenticity_token
  def create
    puts 'PARAMS: ', params
    head :ok
  end
end
