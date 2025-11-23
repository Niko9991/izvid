class PapersController < ApplicationController
  before_action :set_paper, only: %i[ show edit update destroy ]
  before_action :set_supplier, only: %i[ new create show edit]

  # GET /papers or /papers.json
  def index
    @papers = Paper.all
  end

  # GET /papers/1 or /papers/1.json
  def show
  end

  # GET /papers/new
  def new
    @supplier =Supplier.where(user: current_user)
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
  end

  # POST /papers or /papers.json
  def create
    @paper = Paper.new(paper_params)
    @paper.supplier = @supplier  # <-- THIS FIXES THE ERROR

    respond_to do |format|
      if @paper.save
        format.html { redirect_to @paper, notice: "Paper created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /papers/1 or /papers/1.json
  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to @paper, notice: "Paper was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1 or /papers/1.json
  def destroy
    @paper.destroy!

    respond_to do |format|
      format.html { redirect_to papers_path, notice: "Paper was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def paper_params
      params.expect(paper: [ :year, :article, :group, :labtest, :location_labtest, :certificate, :location_certificate, :comment, :labtest_count, :certificate_count, :supplier_id ])
    end

   def set_supplier
    @supplier = Supplier.find_by(params[:supplier_id])
   end

   def supplier_params
    @supplier.expect(:name)
   end
end
