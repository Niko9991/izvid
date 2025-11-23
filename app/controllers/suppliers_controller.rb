class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ show edit update destroy ]
  before_action :set_user



  def index
   @suppliers = Supplier.where(user: current_user)
  end

  # GET /suppliers/1 or /suppliers/1.json
  def show
    @supplier = Supplier.find(params[:id])
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit tudi lahko @suppliers = current_user.suppliers

  def edit
  end

  # POST /suppliers or /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)
    @user = current_user
    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, notice: "Supplier was successfully created." }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1 or /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to @supplier, notice: "Supplier was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1 or /suppliers/1.json
  def destroy
    @supplier.destroy!

    respond_to do |format|
      format.html { redirect_to suppliers_path, notice: "Supplier was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def supplier_params
      params.require(:supplier).permit(:name, :description, :email)
    end

    def set_user
      @user=current_user
    end
end
