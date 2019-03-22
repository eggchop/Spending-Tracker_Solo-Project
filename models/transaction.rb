require_relative('../db/sql_runner')
require 'Time'

class Transaction
  attr_reader :id, :price
  attr_accessor :tag_id, :merchant_id, :date_added
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @date_added = options['date_added'] if options['date_added']
    @price = options['price'].to_f
    @tag_id = options['tag_id'].to_i
    @merchant_id = options['merchant_id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run( sql )
  end

  def save()
    sql = "INSERT INTO transactions (date_added,price,tag_id,merchant_id) VALUES ('#{Time.now()}',$1,$2,$3)RETURNING id,date_added"
    values = [@price,@tag_id,@merchant_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    date_added = result.first['date_added']
    @id = id
    @date_added = Time.parse(date_added)
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

  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Transaction.new(result)
  end

  def self.find_by_tag(tag_name)
    sql = "SELECT *
          FROM transactions
          JOIN tags
          ON tags.id = transactions.tag_id
          WHERE tags.name = $1
          ORDER BY transactions.date_added"
    values = [tag_name.downcase]
    return SqlRunner.run(sql, values).map{|hash| Transaction.new(hash)}
  end

  def self.find_by_merchant(merchant_name)
    sql = "SELECT *
          FROM transactions
          JOIN merchants
          ON merchants.id = transactions.merchant_id
          WHERE merchants.name = $1
          ORDER BY transactions.date_added"
    values = [merchant_name.downcase]
    return SqlRunner.run(sql, values).map{|hash| Transaction.new(hash)}
  end

  def self.find_by_month(month)
    object_array = self.all
    object_array.select{|transaction| transaction.date_added.month == month}
    return object_array
  end

  def self.total
    sql = "SELECT SUM(transactions.price) AS total
          FROM transactions"
    return SqlRunner.run(sql).first['total'].to_f
  end



end
