module Admin
  class CountriesController < BaseController
    SEARCH_ATTRIBUTES = [
      { name: 'countries.id', method: :exact, type: :integer },
      { name: 'countries.name', method: :like },
      { name: 'countries.abbreviation', method: :like }
    ].freeze

    before_action :set_country, only: %i[show edit update destroy]

    def index
      @countries = search(Country.all).order(order_by[:value]).page(params[:page])
    end

    def new
      @country = Country.new
    end

    def create
      @country = Country.new(country_params)

      if @country.save
        redirect_to [:admin, @country]
      else
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @country.update(country_params)
        redirect_to [:admin, @country]
      else
        render :edit
      end
    end

    def destroy
      @country.destroy
      redirect_to admin_countries_path
    end

    private

    def set_country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name, :abbreviation)
    end
  end
end
