require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')


Merchant.delete_all
Tag.delete_all
Transaction.delete_all

merchant1 = Merchant.new({'name'=>'Tesco'})
merchant1.save
merchant2 = Merchant.new({'name'=>'Lothian Buses'})
merchant2.save

tag1 = Tag.new({'name'=> 'groceries'})
tag1.save
tag2 = Tag.new({'name'=> 'transport'})
tag2.save

transaction1 = Transaction.new({'price'=> 49.08,'tag_id' => tag1.id, 'merchant_id'=> merchant1.id})
transaction1.save
transaction2 = Transaction.new({'price'=> 25.12,'tag_id' => tag1.id, 'merchant_id'=> merchant1.id})
transaction2.save
transaction3 = Transaction.new({'price'=> 17.70,'tag_id' => tag2.id, 'merchant_id'=> merchant2.id})
transaction3.save

# p transaction1.date_added.friday?
