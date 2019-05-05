User.create!(name:  "dinhvantuyen",
             email: "dinhtuyen.dgt@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             phone: "0123456789",
             activated: "true",
             activated_at: Time.zone.now)

Category.create!(name: "Canh")
Category.create!(name: "Đồ nướng")
Category.create!(name: "Lẩu")

Product.create!(name:  "Thit kho",
             price: 100,
             sale_price: 80,
             sale_count: 10,
             quantity: 10,
             description: "Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem."
             )

Review.create!(rate: "4",
               comment: "Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.",
               user_id: "1",
               product_id: "1")

10.times do |n|
  name  = Faker::Name.name
  price = n+100
  sale_price = n+80
  sale_count = n+10
  quantity = 100
  description = "Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem."
  Product.create!(name:  name,
               price: price,
               sale_price: sale_price,
               sale_count: sale_count,
               quantity: quantity,
               description: description)
end

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "123456"
  User.create!(name:  name,
               email: email,
               phone: "0123456789",
               password:              password,
               password_confirmation: password)
end

10.times do |n|
  rate = "5"
  comment = "Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi."
  user_id = n+1
  product_id = n+1
  Review.create!(rate:  rate,
               comment: comment,
               user_id: user_id,
               product_id: product_id)
end
User.create!(name:  "Duke",
             email: "thuanduc.97@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             phone: "0975224497",
             role: :admin,
             activated: true,
             activated_at: Time.zone.now)
