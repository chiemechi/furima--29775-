
## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| last_name| string | null: false |
|first_name| string | null: false |
|first_kana| string | null: false |
|last_kana | string | null: false |
|birth_day |date    | null: false |


has_many:items
has_many:purchases

## itemsテーブル

| Column    | Type   | Options     |
| ------   | ------ | ----------- 
| name     | string | null: false |
|description|text | null: false |
| price    | integer| null: false |
|category_id  | integer| null: false |
|condition_id |integer | null: false |
|charges_id   | integer| null: false |
|area_id      |integer | null: false |
| date_id     ｜integer  | null: false |
| user | references | null: false, foreign_key: true |

belongs_to:users
has_one:purchases


## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|item   | references | null: false, foreign_key: true |
|user    | references | null: false, foreign_key: true |



belongs_to:user
belongs_to:item
has_one:address


## addresses テーブル


| Column    | Type       | Options                        |
| -------   |  ----------| ------------------------------|
|prefectures_id| integr   |null: false                     |
|city       | string 　　　| null: false,                   ｜
|building   | string     |                ｜
|num        | string     | null: false,                   ｜
|phone_number| string     | null: false,                   ｜
|purchase  | references | null: false, foreign_key:true  |



belongs_to:purchase
