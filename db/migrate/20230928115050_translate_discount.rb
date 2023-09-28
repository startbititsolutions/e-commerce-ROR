class TranslateDiscount < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        I18n.with_locale(:en) do
          Discount.create_translation_table!({
            :title => :string,
            :code => :string
          }, {
            :migrate_data => true
          })
        end
      end

      dir.down do
        Discount.drop_translation_table! 
      end
    end
  end  
end
