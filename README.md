
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
| yar      | string | null: false |
| month    | string | null: false |
|day       | string | null: false |

has_meny:items
has_many:purchase
has_one:pay

## itemsテーブル

| Column    | Type   | Options     |
| ------   | ------ | ----------- 
| name     | string | null: false |
|description| string | null: false |
| price    | string | null: false |
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

has_many:items


## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item_id| references | null: false, foreign_key: true |
|user_id | references | null: false, foreign_key: true |

belongs_to:user
has_one:pay
has_one:address

## pay テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
|card_num | string     |null: false                     |
|year     | references | null: false,                   ｜
|month    | references | null: false,                   ｜
|code     | references | null: false,                   ｜
|user_id | references | null: false, foreign_key:true   |

has_one:purchases
has_one:users

## adress テーブル


| Column    | Type       | Options                        |
| -------   |  ----------| ------------------------------|
|prefectures| string     |null: false                     |
|city       | references | null: false,                   ｜
|building   | references | null: false,                   ｜
|num        | references | null: false,                   ｜
|phoe_number|references | null: false,                   ｜
|user_id    | references | null: false, foreign_key:true  |

has_one:purchases