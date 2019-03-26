require_relative('../db/sql_runner')

class Tag
  attr_reader :id
  attr_accessor :name
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name'].downcase
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run( sql )
  end

  def self.find(id)
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Tag.new(result)
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM tags
    WHERE name = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Tag.new(result)
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.all
    sql = "SELECT * FROM tags"
    return SqlRunner.run(sql).map{|hash| Tag.new(hash)}
  end

  def update
    sql = "UPDATE tags SET name = $1 WHERE id = $2"
    values = [@name,@id]
    SqlRunner.run(sql,values)
  end

  def delete
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

end
