class Medicine < ActiveRecord::Base
  belongs_to :user

  def calculate_refill_date
    num_of_days = self.number_in_bottle / self.dose_number
    refill_date = DateTime.now.next_day(num_of_days)
  end
end
