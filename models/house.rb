require_relative('../db/sql_runner')

class House

  attr_reader :id
  attr_accessor :name, :url

  def initialize( houses )
    @id = houses['id'].to_i if houses['id']
    @name = houses['name']
    @url = houses['url']
  end

  def save()
    sql = "INSERT INTO houses
    (
      name,
      url
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @url]
    houses_data = SqlRunner.run(sql, values)
    @id = houses_data.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM houses;"
    SqlRunner.run(sql)
  end

  def update()
      sql = "UPDATE houses
      SET
      (
        name,
        url
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@name, @url, @id]
      SqlRunner.run( sql, values )
    end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run( sql )
    result = houses.map { |house| House.new( house ) }
    return result
  end
#
  def self.find( id )
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run( sql, values )
    result = self.new( house.first )
    return result
  end
#
end
