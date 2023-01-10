class Document < ApplicationRecord
  belongs_to :client
  has_one_attached :file
  TAX_NAME = ["IVA", "SIJP", "SICORE", "ING. BRUTOS", "GANANCIAS"]
  AGENCY_NAME = ["RENTAS", "AFIP"]

  include PgSearch::Model

  pg_search_scope :search_by_name_and_agency,
                  against: [ :description, :agency, :tax_name, :date ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
