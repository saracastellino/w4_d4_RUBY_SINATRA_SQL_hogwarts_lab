require_relative('../db/sql_runner')

class Student

  attr_reader :id
  attr_accessor :first_name, :second_name, :house_id, :age

  def initialize( students )
    @id = students['id'].to_i if students['id']
    @first_name = students['first_name']
    @second_name = students['second_name']
    @house_id = students['house_id'].to_i 
    @age = students['age'].to_i
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      second_name,
      house_id,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @second_name, @house_id, @age]
    students_data = SqlRunner.run(sql, values)
    @id = students_data.first()['id'].to_i
  end


  def student_name()
  return "#{@first_name} #{@second_name}"
end

def self.delete_all()
  sql = "DELETE FROM students;"
  SqlRunner.run(sql)
end

def update()
  sql = "UPDATE students
  SET
  (
    first_name,
    second_name,
    house_id,
    age
  ) =
  (
    $1, $2, $3, $4
  )
  WHERE id = $5"
  values = [@first_name, @second_name, @house_id, @age, @id]
  SqlRunner.run( sql, values )
end


  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run( sql )
    result = students.map { |student| Student.new( student ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run( sql, values )
    result = self.new( student.first )
    return result
  end

  def houses
    sql = "SELECT * FROM students WHERE house_id = $1"
    values = [@id]
    houses_info = SqlRunner.run(sql, values)
    houses_info.map {|house| House.new(house)}
  end

end
