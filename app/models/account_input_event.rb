class AccountInputEvent < ActiveRecord::Base
  belongs_to :account
  
  validates_presence_of :account_id, :value
  
  after_create do |input_event| 
    input_event.account.deposit(input_event.value).save!
  end #after event creation call account to do it job
end
