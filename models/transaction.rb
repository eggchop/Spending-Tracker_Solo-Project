require_relative('../db/sql_runner')

class Transaction
  attr_reader :id,:date_added, :price
  attr_accessor :tag_id, :merchant_id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @date_added = options['date_added']
    @price = options['price'].to_f
    @tag_id = options['tag_id'].to_i
    @merchant_id = options['merchant_id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run( sql )
  end

  def save()
    sql = "INSERT INTO transactions (date_added,price,tag_id,merchant_id) VALUES ($1,$2,$3,$4)RETURNING id"
    values = [@date_added,@price,@tag_id,@merchant_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.all
    sql = "SELECT * FROM transactions"
    return SqlRunner.run(sql).map{|hash| Transaction.new(hash)}
  end

  def update
    sql = "UPDATE transactions SET (date_added,price,tag_id,merchant_id) = ($1,$2,$3,$4) WHERE id = $5"
    values = [@date_added,@price,@tag_id,@merchant_id,@id]
    SqlRunner.run(sql,values)
  end

  def delete
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

end
