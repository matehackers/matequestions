class Question < ActiveRecord::Base

  ANSWER_TYPES = {
    'text' => 1,
    'website' => 2
  }

  attr_accessible :answer, :inquiry, :answer_type

  validates :answer, :presence => true
  validates :inquiry, :presence => true
  validates :answer_type, :presence => true, 
            :inclusion => {:in => ANSWER_TYPES.values}

  def self.answer_types
    ANSWER_TYPES
  end

  def answer_type_name
    ANSWER_TYPES.invert[answer_type]
  end

  def match a
    regexp = Regexp.new(answer.downcase)
    regexp.match(a.downcase.strip) ? true : false
  end

end
