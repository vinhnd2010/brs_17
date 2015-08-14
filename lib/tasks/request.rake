namespace :request do
  desc "Delete all accepted request"
  task delete_request: :environment do
    Request.request_accepted_in_month.destroy_all
  end
end
