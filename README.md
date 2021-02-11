    ## Users Tabel
    |---------------------------|-------|------------------------|
    |Column                     | Type  |  Options               | 
    |---------------------------|-------|------------------------|
    |nickname                   |string |null:false              |
    |email                      |string |null:false ,unique: true|
    |encrypted_password         |string |null:false              |
    |last-name                  |string |null:false              |
    |first-name                 |string |null:false              |
    |last-kana                  |string |null:false              |
    |first-kana                 |string |null:false              |
    |birth_day                  |date   |null:false              |
    |---------------------------|-------|------------------------|

    ### Association
    has_many :products
    belongs_to :order


----------------------------- ----------------------------- -----------------------------

## products Tabel
|---------------|---------|-------------------|
| Column        |Type     | Options           |
|---------------|---------|-------------------|
|name           |string   |null:false         |
|description    |text     |null:false         |
|category_id    |integer  |null:false         |
|states         |integer  |null:false         |
|carriage_id    |integer  |null:false         |
|prefecture_id  |integer  |null:false         |
|Days_to_ship_id|integer  |null:false         |
|price          |integer  |null:false         |
|shipping_id    |integer  |null:false         |
|user           |reference|null:false         |

### Association
  belongs_to :user  
  has_one :order  

----------------------------- ----------------------------- -----------------------------
## address Tabel

|Column      |Type     |Options            |
|------------|---------|-------------------|
|postcode    |string   |null:false         |
|prefecture_id|integer |null:false         |
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

|Column      |Type     |Options            |
|------------|---------|-------------------|
|user        |reference|null:false         |
|item        |reference|null:false         |

### Association
  belongs_to prodact
  belongs_to user