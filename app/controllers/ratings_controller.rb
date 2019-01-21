class RatingsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.new
  end

  def create
    if current_user then
      @product = Product.find(params[:product_id])
      @rating = @product.ratings.create(
        product_id: params[:product_id],
        user_id: current_user.id,
        rating: rating_params[:rating],
        description: rating_params[:description]
      )

      if @rating.save
        # redirect to "/products/#{params[:product_id]}"
        redirect_to :back
      end
    else
      # User needs to log in to leave a review
      redirect_to '/login'
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