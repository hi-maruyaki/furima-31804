    ## Users Table
    |---------------------------|-------|------------------------|
    |Column                     | Type  |  Options               | 
    |---------------------------|-------|------------------------|
    |nickname                   |string |null:false              |
    |email                      |string |null:false ,unique: true|
    |encrypted_password         |string |null:false              |
    |last_name                  |string |null:false              |
    |first_name                 |string |null:false              |
    |last_kana                  |string |null:false              |
    |first_kana                 |string |null:false              |
    |birth_day                  |date   |null:false              |
    |---------------------------|-------|------------------------|

    ### Association
      has_many :orders
      has_many: products


----------------------------- ----------------------------- -----------------------------

## products Table

| Column        |Type     | Options           |
|---------------|---------|-------------------|
|name           |string   |null:false         |
|description    |text     |null:false         |
|user           |reference|foreign_key: true  |

### Association
  belongs_to :user  
  has_one :order

----------------------------- ----------------------------- -----------------------------
## address Table

|Column        |Type     |Options            |
|--------------|---------|-------------------|
|postcode      |string   |null:false         |
|prefecture_id |integer  |null:false         |
|city          |string   |null:false         |
|address       |string   |null:false         |
|building_name |string   |                   |
|tellphone     |string   |null:false         |
|order         |reference|foreign_key: true  |


### Association
  belongs_to :order
  
   
  ----------------------------- ----------------------------- -----------------------------
## orders Table

|Column     |Type     |Options                 |
|-----------|---------|------------------------|
|user       |reference|foreign_key: true       |
|item       |reference|foreign_key: true       |

### Association
  belongs_to product
  has_one address
  belongs_to user
