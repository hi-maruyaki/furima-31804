## Users Tabel
|---------------------------|-------|------------------|
|Column                     | Type  |  Options         |
|---------------------------|-------|------------------|
|nickname                   |string |null:false        |
|email                      |string |null:false        |
|paswspassword_confirmation |string |null:false        |
|last-name                  |string |null:false        |
|first-name                 |string |null:false        |
|last-kana                  |string |null:false        |
|first-kana                 |string |null:false        |
|birth_day                  |date   |null:false        |
|---------------------------|-------|------------------|

### Association
has_many :products : through :destroy
belongs_to :destination through: :destroy


----------------------------- ----------------------------- -----------------------------

## products Tabel
|------------|---------|-------------------|
| Column     |Type     | Options           |
|------------|---------|-------------------|
|name        |string   |null:false         |
|description |text     |null:false         |
|category    |integer  |foreign_key: true	 |
|states      |integer  |foreign_key: true	 |
|carriage    |integer  |foreign_key: true	 |
|prefecture  |integer  |foreign_key: true	 |
|Days to ship|integer  |foreign_key: true	 |
|price       |integer  |null:false         |
|shipping_id |integer  |                   |
|user_id     |reference|null:false         |
|------------|---------|-------------------|

### Association
  belongs_to :user 
  belongs_to :category 
  has_many :images 

|---------------|---------|-------------------|
|name           |string	null: false|
|price          |string	null: false|
|description	  |string	null: false
|status         |string	null: false
|size           |string|null: false
|shipping_cost	|string	null: false
|shipping_days	|string	null: false
|prefecture_id	|string	null: false
|judgment       |string	
|category_id    |integer	null: false, foreign_key: true
|brand_id	integer	null: false, foreign_key: true
|	
|	integer	null: false, foreign_key: true
----------------------------- ----------------------------- -----------------------------
## address Tabel
|------------|---------|-------------------|
|Column      |Type     |Options            |
|------------|---------|-------------------|
|user        |reference|null:false         |
|item        |reference|null:false         |
|postcode    |integer  |null:false         |
|prefecture  |integer  |foreign_key: true  |
|city        |string   |null:false         |
|address1    |string   |null:false         |
|address2    |string   |                   |
|tellphone   |string   |null:false         |
|------------|---------|-------------------|

### Association
  belongs_to :items
  belongs_to :user

----------------------------- ----------------------------- -----------------------------


## image image
|------------|----------|------------------------------|
|Column	     |   Type   |Options                       |
|------------|----------|------------------------------|
|image       |  string  |null: false                   |
|product_id  | string   |                              |
|------------|----------|------------------------------|
### Association
  belongs_to :product

----------------------------- ----------------------------- -----------------------------

## image image
|------------|----------|------------------------------|
|Column	     |   Type   |Options                       |
|------------|----------|------------------------------|
|user_id     |  integer |null: false, foreign_key: true|
|customer_id |string    |null: false                   |
|card_id     | string   |null: false                   |
|------------|----------|------------------------------|
### Association
  belongs_to :user