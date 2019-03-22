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

end
