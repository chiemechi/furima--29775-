
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
| date     |integer | null: false |


has_meny:items
has_meny:purchases

## itemsテーブル

| Column    | Type   | Options     |
| ------   | ------ | ----------- 
| name     | string | null: false |
|description|text 　| null: false |
| price    | integer| null: false |
|category_id  | string | null: false |
|condition_id |integer | null: false |
|charges_id   | integer| null: false |
|area_id      |integer | null: false |
| date     ｜integer | null: false |
| user | references | null: false, foreign_key: true |


## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|item   | references | null: false, foreign_key: true |
|user    | references | null: false, foreign_key: true |

belongs_to:user
has_one:address


## addresses テーブル


| Column    | Type       | Options                        |
| -------   |  ----------| ------------------------------|
|prefectures_id| integr   |null: false                     |
|city       | string 　　　| null: false,                   ｜
|building   | string     |                ｜
|num        | string     | null: false,                   ｜
|phone_number| string     | null: false,                   ｜
|user   | references | null: false, foreign_key:true  |


belongs_to:purchase