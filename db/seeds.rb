require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/budget')

require 'Time'
require 'pry'

Merchant.delete_all
Tag.delete_all
Budget.delete_all
# Transaction.delete_all

merchant1 = Merchant.new({'name'=>'Tesco'})
merchant1.save
merchant2 = Merchant.new({'name'=>'Landlord'})
merchant2.save
merchant3 = Merchant.new({'name'=>'Chanter'})
merchant3.save
merchant4 = Merchant.new({'name'=>'Odeon'})
merchant4.save

tag1 = Tag.new({'name'=> 'groceries'})
tag1.save
tag2 = Tag.new({'name'=> 'transport'})
tag2.save
tag3 = Tag.new({'name'=> 'drinking'})
tag3.save
tag4 = Tag.new({'name'=> 'bills'})
tag4.save
tag4 = Tag.new({'name'=> 'dinner'})
tag4.save
tag4 = Tag.new({'name'=> 'shopping'})
tag4.save
tag5 = Tag.new({'name'=> 'beauty'})
tag5.save
tag6 = Tag.new({'name'=> 'misc'})
tag6.save
tag7 = Tag.new({'name'=> 'vices'})
tag7.save

budget1 = Budget.new({'name'=> "Charlie's Budget",'end_date'=> '2019-04-19', 'amount'=> 1000.00})
budget1.save


transaction1 = Transaction.new({'price'=> 70.00,'tag_id' => tag1.id, 'merchant_id'=> merchant1.id, 'budget_id'=> budget1.id})
transaction1.save
# transaction1.date_added = Date.new(2017,01,23)
# transaction1.update
transaction2 = Transaction.new({'price'=> 30.00,'tag_id' => tag3.id, 'merchant_id'=> merchant3.id,'budget_id'=> budget1.id})
transaction2.save
transaction3 = Transaction.new({'price'=> 23.00,'tag_id' => tag4.id, 'merchant_id'=> merchant2.id,'budget_id'=> budget1.id})
transaction3.save
transaction3 = Transaction.new({'price'=> 23.00,'tag_id' => tag5.id, 'merchant_id'=> merchant3.id,'budget_id'=> budget1.id})
transaction3.save
transaction3 = Transaction.new({'price'=> 23.00,'tag_id' => tag6.id, 'merchant_id'=> merchant4.id,'budget_id'=> budget1.id})
transaction3.save
transaction3 = Transaction.new({'price'=> 23.00,'tag_id' => tag7.id, 'merchant_id'=> merchant1.id,'budget_id'=> budget1.id})
transaction3.save
transaction3 = Transaction.new({'price'=> 23.00,'tag_id' => tag4.id, 'merchant_id'=> merchant2.id,'budget_id'=> budget1.id})
transaction3.save

# tags = Transaction.all_tags_in_use
#
# total_dict = {}
# tags.each do |item|
#   total = Transaction.total_by_tag(item)
#   total_dict[item] = total
# end
# @total_dict_sorted = total_dict.sort_by{ |k, v| v }
#
# p total_dict
#
# result = total_dict.sort_by{ |k, v| v }
# p result
#
# 5.times do
#   tag, value = result.pop
#   p tag
#   p value
# end
