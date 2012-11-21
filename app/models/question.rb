class Question < ActiveRecord::Base

  ANSWER_TYPES = {
    'text' => 1,
    'website' => 2
  }

  attr_accessible :answer, :inquiry, :answer_type, :next

  validates :answer, :presence => true
  validates :inquiry, :presence => true
  validates :answer_type, :presence => true, 
            :inclusion => {:in => ANSWER_TYPES.values}

  def self.find_first
    # Finds questions which are not next to any other question
    self.where("id NOT IN (?)", self.select(:next).map(&:next))
  end

  def self.find_last
    # Finds the question which is next to itself, meaning it's the last one
    self.where("id == next")
  end

  def self.answer_types
    ANSWER_TYPES
  end

  # Returns a list of question [inquires, id] for display
  def self.question_names question
    questions = self.all
    # puts a '*' next to the question passed as parameter
    questions = questions.map { |q| [ (q == question ? '*' : '') + q.inquiry, q.id] }
  end

  def answer_type_name
    ANSWER_TYPES.invert[answer_type]
  end

  def match a
    regexp = Regexp.new(answer.downcase)
    regexp.match(a.downcase.strip) ? true : false
  end

  # Returns the question next to the current one
  def get_next
    self.class.find(self.next)
  end

end
