class Medicine < ActiveRecord::Base
  belongs_to :user

  validates :name, :dose_number, :number_in_bottle, presence: true

  def calculate_refill_date
    num_of_days = self.number_in_bottle / self.dose_number
    refill_date = DateTime.now.next_day(num_of_days)
  end

  def call_for_refill
    call_date = self.refill_date.days_ago(5)
  end
end
