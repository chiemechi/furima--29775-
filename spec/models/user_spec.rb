require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

          
        it "全て記入されていると登録できる" do
            expect(@user).to be_valid
          end
        

        it "nicknameが空では登録できないこと" do
          
          @user.nickname=nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "passwordが空では登録できないこと" do
          @user.password=nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end



        it "last_nameが空では登録できないこと" do
          @user.last_name=nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it "first_nameが空では登録できないこと" do
          @user.first_name=nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end  

        it "first_name_kanaが空では登録できないこと" do
          @user.first_name_kana=nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it "last_name_kanaが空では登録できないこと" do
          @user.last_name_kana=nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        
        it "birth_dayが空では登録できないこと" do
          @user.birth_day=nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end

        it "重複したemailが存在する場合登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

      it "確認用パスワードは必ず必要"do
        @user.password_confirmation=nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it "emailが意図しない形ならNG" do
        @user.email="3333333"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Email is invalid")
      end

      it"ユーザー本名は全角（漢字・ひらがな・カタカナ）でないとNG"do
      @user.first_name="3333333"
      @user.last_name="44444"
      @user.valid?
      expect(@user.errors.full_messages).to include( "First name is invalid", "Last name is invalid")
      end

    
      it"ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
        @user.first_name_kana="あいう"
        @user.last_name_kana="あいう"
        @user.valid? 
      expect(@user.errors.full_messages).to include( "First name kana is invalid", "Last name kana is invalid")
      end

  end
end