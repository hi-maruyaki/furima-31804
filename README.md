    ## Users Table
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

## products Table

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
|user           |reference|foreign_key: true  |

### Association
  belongs_to :user  
  has_one :order

----------------------------- ----------------------------- -----------------------------
## address Table

|Column       |Type     |Options            |
|-------------|---------|-------------------|
|postcode     |string   |null:false         |
|prefecture_id|integer  |null:false         |
|city         |string   |null:false         |
|address      |string   |null:false         |
|building_name|string   |                   |
|tellphone    |string   |null:false         |
|-------------|---------|-------------------|

### Association
  belongs_to :items
  belongs_to :user

----------------------------- ----------------------------- -----------------------------
## orders Table

|Column      |Type     |Options                 |
|------------|---------|------------------------|
|user        |reference|foreign_key: true       |
|item        |reference|foreign_key: true       |

### Association
  belongs_to product
  belongs_to user

  references型を使用するのであれば、オプションに外部キー制約を貼りましょう！

