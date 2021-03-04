# usersテーブル

| culumn  | type   | options       |
| ------  | ----   | ------------- |
| name    | string | null: false, unique: true |　
| email   | string | null: false, unique: true |　
| password | string | null: false | 
| first_name | string | null: false | 
| family_name | string | null: false | 
| first_name_kana | string | null: false | 
| family_name_kana | string | null: false | 
| birthday | date | null: false | 
| introduction | text | 

# Association
• has_many :products　

• has_many :buyers


# productsテーブル
| culumn  | type   | options       |
| ------  | ----   | ------------- |
| title    | string | null: false   | 
| price   | string | null: false | 
| size    | string | null: false |
| brand   | references | foreign_key: true | 
| seller  | integer | null: false | 
| buyer   | integer |

# Association
•belongs_to :user

•has_one :buyer

# addressesテーブル
| culumn  | type   | options       |
| ------  | ----   | ------------- |
| prefecture | integer | null: false | 
| postal | integer | null: false |  
| city    | string | null: false | 
| house_number | string | null: false |
| building_name | string | 
| phone_number | integer | unique: true |

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
