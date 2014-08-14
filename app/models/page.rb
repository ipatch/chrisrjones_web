class Page < ActiveRecord::Base
  # attr_accessible :title, :body

  # Kevin suggests putting relationship definitions at the top of the model classes
  belongs_to :subject
  # Added content from Chapter 9 Video 12
  has_many :sections
  # the below line will work with a many-to-many relationship
  # has_and_belongs_to_many :admin_users
  # to specify a different name for admin_users, i.e. editors
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  # enable sorting of pages using acts_as_list RubyGem
  acts_as_list :scope => :subject

  # adding callbacks
  # the below "callback" will add a default permalink if the user 
  # does not provide one.
  before_validation :add_default_permalink
  after_save :touch_subject
  after_destroy :delete_related_sections

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink
  # for unique values by subject use ":scope => :subject_id" 
  
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("pages.position ASC") }
  scope :newest_first, lambda { order("pages.created_at DESC")}

  private

    def add_default_permalink
      if permalink.blank?
        self.permalink = "#{id}-#{name.parameterize}"
      end
    end

    def touch_subject
      # touch is smiliar to:
      # subject.update_attribute(:updated_at, Time now)
      subject.touch
    end

    def delete_related_sections
      self.sections.each do |section|
        # Or perhaps instead of destroy, you would
        # move them to another page.
        # section.destroy
    end
  end

end
