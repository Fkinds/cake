class Admin::HomesController < ApplicationController
  def top
    @Orders = Order.all
  end
end
