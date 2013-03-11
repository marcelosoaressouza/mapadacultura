# encoding: utf-8

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me, :cpf, :firstname, :lastname, :admin


  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :cpf, :presence => true,
            :uniqueness => true

  validates :firstname, :presence => true,
                        :length => { :minimum => 3, :maximum => 254 }

  validates :lastname, :presence => true,
                       :length => { :minimum => 3, :maximum => 254 }

  usar_como_cpf :cpf

  has_many :entidade_equipamentos
end
