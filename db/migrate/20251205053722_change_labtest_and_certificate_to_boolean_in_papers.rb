class ChangeLabtestAndCertificateToBooleanInPapers < ActiveRecord::Migration[8.0]
  def change
     change_column :papers, :labtest, :boolean, default: false
     change_column :papers, :certificate, :boolean, default: false
  end
end
