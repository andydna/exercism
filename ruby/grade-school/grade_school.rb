class School < Array

  def students grade
    self[grade] ? self[grade].sort : []
  end

  def add student, grade
    self[grade] = [] unless self[grade]
    self[grade] << student
  end

  def students_by_grade
    self.each_with_index.map do |students, grade|
      next unless students
      { grade: grade, students: self.students(grade) }
    end.reject { |grade| grade.nil? }
  end
end

module BookKeeping
  VERSION = 3
end
