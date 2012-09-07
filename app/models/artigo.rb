class Artigo < ActiveRecord::Base
  belongs_to :coluna

  before_save :criar_slug

  def criar_slug
  	self.slug = self.chamada.parameterize
  end
end