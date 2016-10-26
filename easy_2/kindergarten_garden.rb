class Garden
  PLANTS = { violets: 'V', clover: 'C', radishes: 'R', grass: 'G' }
  STUDENTS = %w(bob alice charlie david eve fred ginny harriet 
                ileana joseph kincaid larry)
  
  attr_accessor :garden
  attr_reader :row1, :row2, :students
  
  def initialize(diagram, students=STUDENTS)
    @row1 = diagram.split("\n").first
    @row2 = diagram.split("\n").last
    @students = students.map(&:downcase).sort
    @garden = Hash.new(0)
    create_garden
    create_student_methods
  end
  
  def create_garden
    students.each do |student|
      plants = row1.slice!(0..1)
      plants << row2.slice!(0..1)
      garden[student] = plants.chars.map { |char| PLANTS.key(char) }
    end
  end 
  
  def create_student_methods
    garden.each do |name, values|
      define_singleton_method(name) { values }
      # alternative way of setting methods
      # instance_variable_set("@#{name}", values)
      # self.class.send(:attr_reader, name)
    end
  end
end

diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
garden = Garden.new(diagram)
p garden.alice
p garden.bob

