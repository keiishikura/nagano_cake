class Public::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.order(created_at: :desc).first(4)
  end

end
