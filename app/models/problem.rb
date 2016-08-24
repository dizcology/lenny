class Problem < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :content, :solutions
  
  serialize :content, JSON
  serialize :solutions, JSON
end
