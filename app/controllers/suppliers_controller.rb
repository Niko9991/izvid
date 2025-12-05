class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show edit update destroy]

  def index
  @suppliers = current_user.suppliers
   if params[:search].present?
    @suppliers = @suppliers.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")

   end
  end


  def show
    # only papers for this supplier
  end


  def new
    @supplier = current_user.suppliers.build
  end

  def create
    @supplier = current_user.suppliers.build(supplier_params)
    if @supplier.save
      redirect_to @supplier, notice: "Supplier created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: "Supplier was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @supplier.destroy
    redirect_to suppliers_path, notice: "Supplier was successfully destroyed."
  end

  private

  def set_supplier
    @supplier = current_user.suppliers.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:name, :description, :email)
  end
end
