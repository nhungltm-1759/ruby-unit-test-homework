SimpleCov.start "rails" do
  enable_coverage :branch
  minimum_coverage 100

  # skip exercise 1
  add_filter [
    "app/controllers/exercise1_controller.rb",
    "app/services/exercise1/calculate_service.rb"
  ]
  # skip exercise 2
  add_filter [
    "app/controllers/exercise2_controller.rb",
    "app/models/transaction.rb"
  ]
  # skip exercise 3
  add_filter [
    "app/controllers/exercise3_controller.rb",
    "app/services/exercise3/calculate_service.rb"
  ]
  # skip exercise 4
  add_filter [
    "app/controllers/exercise4_controller.rb",
    "app/services/exercise4/calendar_service.rb"
  ]
  # skip exercise 5
  add_filter [
    "app/controllers/exercise5_controller.rb",
    "app/services/exercise5/calculate_service.rb"
  ]
  # skip exercise 6
  add_filter [
    "app/controllers/exercise6_controller.rb",
    "app/services/exercise6/calculate_free_parking_time_service.rb"
  ]
  # skip exercise 7
  add_filter [
    "app/controllers/exercise7_controller.rb",
    "app/services/exercise7/calculate_service.rb"
  ]
  # skip exercise 8
  add_filter [
    "app/controllers/exercise8_controller.rb",
    "app/services/exercise8/calculate_ticket_price_service.rb"
  ]
  # skip exercise 9
  add_filter [
    "app/controllers/exercise9_controller.rb",
    "app/models/hanoi_quest.rb"
  ]
  # skip exercise 10
  add_filter [
    "app/controllers/exercise10_controller.rb",
    "app/services/exercise10/calculate_total_amount_service.rb",
    "app/controllers/concerns/coupon_module.rb",
    "app/helpers/exercise10_helper.rb"
  ]
end
