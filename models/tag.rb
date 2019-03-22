require_relative('../db/sql_runner')

class Tag
  attr_reader :id,:name
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run( sql )
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
end
