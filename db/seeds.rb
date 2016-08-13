User.create! email: 'a@a.a', 
            password: '123456',
            encrypted_password: Devise::Encryptor.digest(User, '123456'), 
            admin: true

User.create! email: 'b@b.b',
            password: '123456',
            encrypted_password: Devise::Encryptor.digest(User, '123456'), 
            admin: false

10.times do |i|
  Post.create! title: ('A'..'Z').to_a.sample + "-#{i}", 
               content: "ABCDEFGHIJKLMNO 1234".split('').shuffle.join,
                created_at: 5.days.ago,
                updated_at: 2.days.ago
end

[ { title: 'Sunny Day', content: 'Hi. about my day... It was sunny, with lots and lots of tasks.' }, 
  { title: 'Rails Greatness', content: "I've been blessed to learn and work on rails. Cheers." }, 
  { title: 'No need for hurry', content: 'Take your time on udacity, ML/ANN, Rails and Web' }
].each do |post|
  Post.create!  title: post[:title], 
                content: post[:content]
end
