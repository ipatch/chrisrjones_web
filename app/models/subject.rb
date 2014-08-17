class Subject < ActiveRecord::Base
  # attr_accessible :title, :body

  # Kevin suggests putting relationships at the top of the model classes
  has_many :pages

  # adding support for sorting through records
  acts_as_list

  # Added via Chapter 12 - Video 4, form errors

  # Don't need to validate (in most cases):
  # ids, foreign keys, timestamps, booleans, counters
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
    # validates_presence_of vs. validates_length_of :minimum => 1
    # different error messages: "can't be blank" or "is too short"
    # validates_length_of allows strings with only spaces!


  scope :visible, lambda { where(:visible => true)}
  scope :invisible, lambda { where(:visible => false)}
  scope :sorted, lambda { order("subjects.position ASC")}
  scope :newest_first, lambda { order ("subjects.created_at DESC")}
  scope :search, lambda {|query|
  	where(["name LIKE ?", "%#{query}%"])
  }

end