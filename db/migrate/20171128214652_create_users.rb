class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    User.create!([
      {name: 'A', email: '@email.com'},
      {name: 'B', email: 'b@email.com'},
      {name: 'C', email: 'c@email.com'}
    ])
  end
end
