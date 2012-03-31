class AccountOutputEvent < ActiveRecord::Base
  belongs_to :account
  
  validates_presence_of :account_id, :value
  
  after_create do |output_event|
    output_event.account.withdraw(output_event.value).save!
  end #after event creation call account to do it job
end
