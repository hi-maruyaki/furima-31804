## Users Tabel
|---------------------------|-------|------------------|
|Column                     | Type  |  Options         |
|---------------------------|-------|------------------|
|nickname                   |string |null:false        |
|email                      |string |null:false        |
|encrypted_password         |string |null:false        |
|last-name                  |string |null:false        |
|first-name                 |string |null:false        |
|last-kana                  |string |null:false        |
|first-kana                 |string |null:false        |
|birth_day                  |date   |null:false        |
|---------------------------|-------|------------------|

### Association
has_many :products 
belongs_to :destination 


----------------------------- ----------------------------- -----------------------------

## products Tabel
|---------------|---------|-------------------|
| Column        |Type     | Options           |
|---------------|---------|-------------------|
|name           |string   |null:false         |
|description_id |integer  |null:false         |
|category_id    |integer  |foreign_key: true  |
|states         |integer  |foreign_key: true  |
|carriage_id    |integer  |foreign_key: true  |
|prefecture     |integer  |foreign_key: true  |
|Days_to_ship_id|integer  |foreign_key: true  |
|price          |integer  |null:false         |
|shipping_id    |integer  |                   |
|user           |reference|null:false         |
|---------------|---------|-------------------|

### Association
  belongs_to :user 

----------------------------- ----------------------------- -----------------------------
## address Tabel
|------------|---------|-------------------|
|Column      |Type     |Options            |
|------------|---------|-------------------|
|postcode    |string   |null:false         |
|prefecture  |integer  |null:false         |
|city        |string   |null:false         |
|address1    |string   |null:false         |
|address2    |string   |                   |
|tellphone   |string   |null:false         |
|------------|---------|-------------------|

### Association
  belongs_to :items
  belongs_to :user

----------------------------- ----------------------------- -----------------------------
## oders Tabel

|------------|---------|-------------------|
|Column      |Type     |Options            |
|------------|---------|-------------------|
|user        |reference|null:false         |
|item        |reference|null:false         |

### Association
  has_one user
  has_one items