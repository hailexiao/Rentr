class BillsController < ApplicationController
  before_action :authenticate_tenant!
  before_action :set_rental_unit_and_bill, only: [:update, :destroy]

  def index
    @bills = Bills.all
  end

  def new
    @bill = Bill.new
  end

  def create
    @rental_unit = RentalUnit.find(params[:rental_unit_id])
    @bill = Bill.new(bill_params)
    @bill.rental_unit = @rental_unit

    if @bill.save
      flash[:notice] = 'Bill added!'
      redirect_to rental_unit_path(@rental_unit)
    else
      flash[:errors] = @bill.errors.full_messages.join(". ")
      redirect_to rental_unit_path(@rental_unit)
    end
  end

  def update
    @bill
    @rental_unit
    authorize_user(@rental_unit)
    @bill.update(month: bill_params[:month], amount: bill_params[:amount])
    if @bill.save
      redirect_to rental_unit_path(@rental_unit)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      redirect_to rental_unit_path(@rental_unit)
    end
  end

  def destroy
    @bill
    @rental_unit
    authorize_user(@rental_unit)
    @bill.destroy
    flash[:success] = 'Bill deleted.'
    redirect_to rental_unit_path(@rental_unit)
  end

  private

  def bill_params
    params.require(:bill).permit(:month, :amount, :rental_unit_id)
  end

  def authorize_user(rental_unit)
    unless current_tenant == rental_unit.tenant
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def set_rental_unit_and_bill
    @bill = Bills.find(params[:id])
    @rental_unit = @bill.rental_unit
  end
end
