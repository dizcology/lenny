class Problem < ActiveRecord::Base
  acts_as_paranoid

  serialize :content, JSON
  serialize :solutions, JSON
end
