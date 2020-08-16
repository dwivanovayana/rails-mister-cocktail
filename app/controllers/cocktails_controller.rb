class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [ :show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      @cocktails = Cocktail.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @cocktails = Cocktail.all
    end
  end


  def show
    # @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail: @cocktail)
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @cocktail.update(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    # @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
