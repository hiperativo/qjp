class CreateColunas < ActiveRecord::Migration
  def self.up
    create_table :colunas do |t|
      t.string :tema
      t.text :resumo
      t.string :icone

      t.timestamps
    end
  end

  def self.down
    drop_table :colunas
  end
end
