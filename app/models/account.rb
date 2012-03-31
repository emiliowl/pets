class Account < ActiveRecord::Base
  
  def deposit(value)
    raise ArgumentError, 'must be a positive number' unless value.is_a? Numeric and value > 0
    self.balance = balance + value
    self
  end
  
  def withdraw(value)
    raise ArgumentError, 'must be a positive number' unless value.is_a? Numeric and value > 0
    raise ArgumentError, 'insufficient funds'        unless can_withdraw?(value)
    
    self.balance = balance - value
    self
  end
  
  has_many   :account_input_events
  has_many   :account_output_events
  
private
  def can_withdraw?(value)
    value <= balance
  end
end
