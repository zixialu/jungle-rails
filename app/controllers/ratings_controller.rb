class RatingsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.create(rating_params)

    if @rating.save
      redirect to "/products/#{params[:product_id]}"
    end
  end

  private

  def rating_params
    params.require(:rating).permit(
      :rating,
      :description
    )
  end

end