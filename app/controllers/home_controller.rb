class HomeController < ApplicationController
  def index
    @productos = Product.all
  end
end
