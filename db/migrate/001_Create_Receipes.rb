def CreateReceipes

    def change
        create_table :products do |t|
          t.string :name
          t.text :description
    
          t.timestamps
        end
      end

end