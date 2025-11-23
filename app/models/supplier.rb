class Supplier < ApplicationRecord
  belongs_to :user
  has_many :papers

  def papers_for(user)
    papers.joins(:supplier).where(suppliers: { user_id: user.id })
  end
end
