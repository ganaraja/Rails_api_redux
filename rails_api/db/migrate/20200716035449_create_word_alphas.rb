class CreateWordAlphas < ActiveRecord::Migration[6.0]
  def change
    create_table :word_alphas do |t|
      t.string :word

      t.timestamps
    end
    add_index :word_alphas, :word_alphas_id
  end
end
