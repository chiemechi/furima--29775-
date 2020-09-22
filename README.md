
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
|category  | string | null: false |
|condition | string | null: false |
|charges   | string | null: false |
|area      | string | null: false |
| date     | string | null: false |
| users_id  | references | null: false, foreign_key: true |

## imagesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|image   | string     | null: false,                   |
|item_id | references | null: false, foreign_key: true |

has_meny:items


## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item_id| references | null: false, foreign_key: true |
|user_id | references | null: false, foreign_key: true |

belongs_to:user
has_one:pay
has_one:address


## addresses テーブル


| Column    | Type       | Options                        |
| -------   |  ----------| ------------------------------|
|prefectures_id| integr     |null: false                     |
|city       | references | null: false,                   ｜
|building   | references | null: false,                   ｜
|num        | references | null: false,                   ｜
|phone_number|references | null: false,                   ｜
|user_id    | references | null: false, foreign_key:true  |


belongs_to:purchase