# User.create!(name:  "dinhvantuyen",
#              email: "dinhtuyen.dgt@gmail.com",
#              password:              "123456",
#              password_confirmation: "123456",
#              phone: "0123456789"
#              address: "Hanoi",
#              role: :admin)
User.create!(name:  "dinhvantuyen",
             email: "dinhtuyen.dgt@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             address: "Hanoi",
             phone: "0123456789")
             # admin: true,
             # activated: true,
             # activated_at: Time.zone.now
             )
Category.create!(name: "Canh")
Category.create!(name: "Đồ nướng")
Category.create!(name: "Lẩu")

Product.create!(name:  "Thit kho",
             price: 100,
             sale_price: 80,
             sale_count: 10,
             description: "Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem."
             )

10.times do |n|
  name  = Faker::Name.name
  price = n+100
  sale_price = n+80
  sale_count = n+10
  description = "Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem."
  Product.create!(name:  name,
               price: price,
               sale_price: sale_price,
               sale_count: sale_count,
               description: description)
end
