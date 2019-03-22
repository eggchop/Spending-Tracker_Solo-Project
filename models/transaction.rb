require_relative('../db/sql_runner')

class Transaction
  attr_reader :id,:date
  def initialize(options)
    @id = options['id'] if options['id']
    @date = options['date']
    @price = options['price']
    @tag_id = options['tag_id']
    @merchant_id = options['merchant_id']
  end

  def save()
    sql = "INSERT INTO transactions (date,price,tag_id,merchant_id) VALUES ($1,$2,$3,$4)RETURNING id"
    values = [@date,@price,@tag_id,@merchant_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end
end
