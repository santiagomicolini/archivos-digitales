class Document < ApplicationRecord
  belongs_to :client
  has_one_attached :file
  TAX_NAME = ["IVA", "SIJP", "SICORE", "ING. BRUTOS", "GANANCIAS"]
  AGENCY_NAME = ["RENTAS", "AFIP"]
end
