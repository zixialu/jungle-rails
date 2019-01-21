class RatingsController < ApplicationController

  before_action :authorize

  def create
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.create(
      product_id: params[:product_id],
      user_id: current_user.id,
      rating: rating_params[:rating],
      description: rating_params[:description]
    )

    if @rating.save
      redirect_to :back
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to :back
  end

  private

  def rating_params
    params.require(:rating).permit(
      :rating,
      :description
    )
  end

end