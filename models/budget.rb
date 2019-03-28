require_relative('../db/sql_runner')
require 'Time'

class Budget
  attr_accessor :start_date, :end_date, :amount, :name
  attr_reader :id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @start_date = options['start_date']
    @end_date = options['end_date']
    @amount = options['amount'].to_f
    @name = options['name']
  end

  def self.delete_all()
    sql = "DELETE FROM budgets"
    SqlRunner.run( sql )
  end

  def save()
    sql = "INSERT INTO budgets (start_date,end_date,amount,name) VALUES ($1,$2,$3,$4) RETURNING id, start_date"
    values = [Date.today,@end_date,@amount,@name]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    start_date = result.first['start_date']
    @id = id
    @start_date = start_date
  end

  def self.all
    sql = "SELECT * FROM budgets"
    return SqlRunner.run(sql).map{|hash| Budget.new(hash)}
  end

  def update
    sql = "UPDATE budgets SET (end_date,amount,name) = ($1,$2,$3) WHERE id = $4"
    values = [@end_date,@amount,@name,@id]
    SqlRunner.run(sql,values)
  end

  def delete
    sql = "DELETE FROM budgets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM budgets
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Budget.new(result)
  end

  def total_spend
    return Transaction.total
  end

  def budget_remaining
    return "£%.2f" % (@amount - self.total_spend)
  end

  def budget_remaining_rounded
    return (@amount - self.total_spend).round
  end

  def budget_progress_bar_color_logic
    percent = ((self.total_spend / @amount) * 100).round
    if percent > 69
      return 'red'
    elsif percent > 29 && percent < 70
      return 'gold'
    else
      return 'green'
    end
  end

  def display_readable_date_start
    timestamp = Time.parse(@start_date)
    return timestamp.strftime("%d-%b-%y")
  end

  def display_readable_date_end
    timestamp = Time.parse(@end_date)
    return timestamp.strftime("%d-%b-%y")
  end

  def display_currency
    return "£%.2f" % @amount
  end
end
