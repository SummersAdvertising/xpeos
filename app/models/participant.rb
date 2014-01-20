# encoding: utf-8
class Participant < ActiveRecord::Base
	
	validates_presence_of :name, :message => '請輸入您的名字'
	validates_presence_of :phone, :message => '請輸入您的聯絡電話'
	
	validates_presence_of :email, :message => '請輸入您的電子信箱'
	validates_format_of :email, :with => /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i, :message => "請輸入正確的電子信箱格式"
	
	validates_presence_of :address, :message => '請輸入您的住址'
	validates_presence_of :key, :message => '請輸入您購買的產品識別碼'
	validates_format_of :key, :with => /\A\w{5}\-\w{5}\-\w{5}\-\w{5}\z/i, :message => '產品識別碼格式有誤，請重新檢查'
	
	validates_presence_of :product, :message => '請勾選您購買的產品類別'
	validates_presence_of :extra, :message => '請勾選購買廠牌'
	validates_presence_of :extra_product, :message => '請輸入購買的產品型號'

	
end
