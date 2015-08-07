namespace :admin do
  desc "TODO"
  task create_admin: :environment do
    User.create(
      [
        {
          name: "Nguyen Ngoc Trung",
          email: "nguyen.ngoc.trung@framgia.com",
          password: "123456",
          password_confirmation: "123456",
          role: User.roles[:admin]
        },
        {
          name: "Nguyen Tien Trung",
          email: "nguyen.tien.trung@framgia.com",
          password: "123456",
          password_confirmation: "123456",
          role: User.roles[:admin]
        },
        {
          name: "Nguyen Duc Vinh",
          email: "nguyen.duc.vinh@framgia.com",
          password: "123456",
          password_confirmation: "123456",
          role: User.roles[:admin]
        }
      ])
  end
end
