json.extract! paper, :id, :year, :article, :group, :labtest, :location_labtest, :certificate, :location_certificate, :comment, :labtest_count, :certificate_count, :supplier_id, :created_at, :updated_at
json.url paper_url(paper, format: :json)
