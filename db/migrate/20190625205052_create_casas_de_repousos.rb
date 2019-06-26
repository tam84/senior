class CreateCasasDeRepousos < ActiveRecord::Migration[5.2]
  def change
    create_table :casas_de_repousos do |t|
      t.string :endereco
      t.string :city
      t.string :bairro
      t.string :name
      t.text :sobre
      t.text :horario
      t.text :outras_informacoes
      t.string :equipe, array: true, default: []
      t.string :instalacao, array: true, default: []
      t.string :preco
      t.string :telefones
      t.string :website      
      t.string :zona

      t.timestamps
    end
  end
end
