class RemoveLabtestCountAndCertificateCountFromPapers < ActiveRecord::Migration[7.0]
  def change
    remove_column :papers, :labtest_count, :integer
    remove_column :papers, :certificate_count, :integer
  end
end
