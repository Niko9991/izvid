# app/controllers/reports_controller.rb
class ReportsController < ApplicationController
  # GET /reports/supplier_report
  def supplier_report
    # load suppliers and include papers to avoid N+1 queries
    @suppliers = Supplier.all.includes(:papers)

    respond_to do |format|
      format.html  # renders supplier_report.html.erb
      format.csv do
        send_data generate_csv,
                  filename: "supplier_report_#{Date.today}.csv",
                  type: "text/csv"
      end
    end
  end

  private

  # generate CSV content
  def generate_csv
    CSV.generate(headers: true) do |csv|
      csv << [ "Supplier", "Lab Tests", "Certificates" ]

      @suppliers.each do |supplier|
        csv << [
          supplier.name,
          supplier.papers.where.not(labtest: [ nil, "" ]).count,
          supplier.papers.where.not(certificate: [ nil, "" ]).count
        ]
      end
    end
  end
end
