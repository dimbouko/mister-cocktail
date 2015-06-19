class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create, :destroy ]

  def new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.create(dose_params)
    # Dose.new(description: "pouet", ingredient_id: 1, cocktail_id: 5)
    # @ingredient.doses.create(description: "pouet", cocktail_id: 5)
    # @cocktail.doses.create(description: "pouet", ingredient_id: 1)

     if @dose.save
      redirect_to cocktail_path(@cocktail)
     else
      render :new
     end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
