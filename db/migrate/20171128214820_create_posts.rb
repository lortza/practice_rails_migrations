class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end

    Post.create!([
      {title: 'title A', body: 'body A'},
      {title: 'title B', body: 'body B'},
      {title: 'title C', body: 'body C'}
    ])
  end
end
