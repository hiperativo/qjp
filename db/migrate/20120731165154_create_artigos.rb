class CreateArtigos < ActiveRecord::Migration
  def self.up
    create_table :artigos do |t|
      t.string :assunto
      t.string :chamada
      t.text :resumo
      t.text :conteudo
      t.string :imagem

      t.timestamps
    end
  end

  def self.down
    drop_table :artigos
  end
end
