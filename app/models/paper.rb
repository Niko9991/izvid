class Paper < ApplicationRecord
  belongs_to :supplier

  scope :with_labtest, -> { where.not(labtest: [ nil, "" ]) }
  scope :with_certificate, -> { where.not(certificate: [ nil, "" ]) }
end
