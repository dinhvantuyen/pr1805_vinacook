User.create!(name:  "dinhvantuyen",
             email: "dinhtuyen.dgt@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             address: "Hanoi",
             phone: "0123456789",
             role: :admin)
Category.create!(name: "Đồ nướng")
Category.create!(name: "Lẩu")
Category.create!(name: "Canh")
