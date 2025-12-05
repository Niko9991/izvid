class PapersController < ApplicationController
  before_action :set_supplier
  before_action :set_paper, only: %i[ show edit update destroy ]

  # GET /suppliers/:supplier_id/papers
  def index
    @papers = @supplier.papers
  end

  # GET /suppliers/:supplier_id/papers/:id
  def show
  end

  # GET /suppliers/:supplier_id/papers/new
  def new
    @paper = @supplier.papers.build
  end

  # GET /suppliers/:supplier_id/papers/:id/edit
  def edit
  end

  # POST /suppliers/:supplier_id/papers
  def create
    @paper = @supplier.papers.build(paper_params)

    if @paper.save
      redirect_to supplier_paper_path(@supplier, @paper), notice: "Paper created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /suppliers/:supplier_id/papers/:id
  def update
    if @paper.update(paper_params)
      redirect_to supplier_paper_path(@supplier, @paper), notice: "Paper updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /suppliers/:supplier_id/papers/:id
  def destroy
    @paper.destroy!
    redirect_to supplier_papers_path(@supplier), notice: "Paper deleted."
  end


  private

  def set_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end

  def set_paper
    @paper = @supplier.papers.find(params[:id])
  end

  def paper_params
    params.require(:paper).permit(
      :year, :article, :group, :labtest, :location_labtest,
      :certificate, :location_certificate, :comment,
      :labtest_count, :certificate_count
    )
  end
end
