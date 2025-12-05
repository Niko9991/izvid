class ReportsController < ApplicationController
  before_action :set_suppliers

  def supplier_report
    supplier_ids = @suppliers.pluck(:id)

    @total_labtests = Paper.where(supplier_id: supplier_ids, labtest: true).count
    @total_certificates = Paper.where(supplier_id: supplier_ids, certificate: true).count

    respond_to do |format|
      format.html
      format.csv do
        send_data generate_csv,
                  filename: "supplier_report_#{Date.today}.csv",
                  type: "text/csv"
      end
    end
  end

  private

  def set_suppliers
    @suppliers = Supplier.for_user(current_user).includes(:papers)
  end

  def generate_csv
    CSV.generate(headers: true) do |csv|
      csv << [ "Supplier", "Lab Tests", "Certificates" ]

      @suppliers.each do |supplier|
        csv << [
          supplier.name,
          supplier.papers.where(labtest: "1").count,
          supplier.papers.where(certificate: "1").count
        ]
      end
    end
  end
end
