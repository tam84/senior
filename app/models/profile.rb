class Profile < ApplicationRecord
  belongs_to :user

  enum english_level: {básico: 0, intermediário: 1, avançado: 2, fluente: 3}   

  enum spanish_level: {nível_básico: 0, nível_intermediário: 1, nível_avançado: 2, nível_fluente: 3}   

  enum educational_level: {nenhum: 0, fundamental_completo: 1, médio_completo: 2, superior_completo: 3, pós_graduação: 3, metrado: 4, doutorado: 5, MBA: 6}   

  has_many_attached :images
  
  has_many_attached :documents


end


