# usersテーブル

| culumn  | type   | options       |
| ------  | ----   | ------------- |
| name    | string | null: false, unique: true |　
| email   | string | null: false, unique: true |　
| encrypted_password | string | null: false | 
| first_name | string | null: false | 
| family_name | string | null: false | 
| first_name_kana | string | null: false | 
| family_name_kana | string | null: false | 
| birthday | date | null: false | 

# Association
• has_many :products　

• has_many :buyers


# productsテーブル
| culumn  | type   | options       |
| ------  | ----   | ------------- |
| title    | string | null: false   | 
| products_status | integer | null: false |
| delivery_fee | integer | null: false | 
| delivery_area | integer | null: false |
| delivery_day | integer | null: false 
| category | integer | null: false |
| price   | integer | null: false |  
| user  | references | null: false,foreign_key: true| 

# Association
•belongs_to :user

•has_one :buyer

# addressesテーブル
| culumn  | type   | options       |
| ------  | ----   | ------------- |
| delivery_area| integer | null: false | 
| postal | string | null: false |  
| city    | string | null: false | 
| house_number | string | null: false |
| building_name | string | 
| phone_number | string | null: false |
| buyer | references | null: false,foreign_key: true | 

# Association

• belong_to :buyer

# buyerテーブル

| culumn  | type   | options       |
| ------  | ----   | ------------- |
| product | references | null: false,foreign_key: true | 
| user    | references | null: false,foreign_key: true |

# Association

•belong_to :user

•belong_to :product

•has_one :address
