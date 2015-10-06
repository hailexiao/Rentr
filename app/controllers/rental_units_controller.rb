class RentalUnitsController < ApplicationController
  def index
    @rental_units = RentalUnit.all
  end

  def show
    @rental_unit = RentalUnit.find(params[:id])
  end

  def new
    @rental_unit = RentalUnit.new
  end

  def create
    existing_unit = unique_address_checker(params[:rental_unit][:address])
    binding.pry
    if existing_unit.nil?
      @rental_unit = RentalUnit.create(rental_unit_params)
    else
      flash[:notice] = 'Unit already exists! Here it is...'
      redirect_to rental_unit_path(existing_unit)
      return
    end

    if @rental_unit.save
      flash[:notice] = 'Rental unit added!'
      redirect_to rental_unit_path(@rental_unit)
    else
      flash[:error] = @rental_unit.errors.full_messages.join (". ")
      render :new
    end
  end

  def destroy
    RentalUnit.find(params[:id]).destroy
    flash[:success] = 'Rental unit deleted.'
    redirect_to rental_units_path
  end

  private

  def rental_unit_params
    params.require(:rental_unit).
      permit(:address, :number_of_bedrooms, :type_of_dwelling, :monthly_rent,
             :gas_utility_id, :electric_utility_id, :tenant_id, :landlord_id,
             :neighborhood_id)
  end

  def unique_address_checker(addr)
    rental_unit = RentalUnit.where(address: addr)

    if rental_unit.empty?
      nil
    else
      rental_unit.first
    end
  end
end