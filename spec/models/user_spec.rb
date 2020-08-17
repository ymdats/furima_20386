require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全てのUserカラムが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '12345abced'
        @user.password_confirmation = '12345abced'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_kanaが空では登録できない' do
        @user.family_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank")
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it '重複したemailが存在する場合登録できない(一意性が無い)' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが@を含まない場合登録できない' do
        @user.email = 'ymdatsgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = '1234567890'
        @user.password_confirmation = '1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'ユーザー苗字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name = 'Simpson'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'ユーザー名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'Homer'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'ユーザー苗字フリガナが全角（カタカナ）でないと登録できない' do
        @user.family_kana = '的井'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it 'ユーザー名前フリガナが全角（カタカナ）でないと登録できない' do
        @user.first_kana = '敦'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid')
      end
    end
  end
end
