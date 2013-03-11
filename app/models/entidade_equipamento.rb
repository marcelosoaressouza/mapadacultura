# encoding: utf-8

class EntidadeEquipamento < ActiveRecord::Base 
  attr_accessible :cep, :cidade, :contato, :descricao, :apresenta, :email, :logradouro, :complemento, :estado, :latitude, :longitude, :gmaps, :publicar, :nome, :site, :slug, :imagem, :tipo_equipamento_id, :tipo_id, :ponto_de_cultura, :tombado, :user_id, :horario, :tipo_natureza_id, :entidade_equipamento_atividades_attributes

  belongs_to :tipo
  belongs_to :tipo_equipamento
  belongs_to :tipo_natureza
  belongs_to :user
  has_one :questionario_basico_entidade

  has_many :fotos,  :dependent => :destroy
  has_many :videos, :dependent => :destroy

  has_many :entidade_equipamento_atividades, :dependent => :destroy,  :uniq => true, :order => "ordem ASC"
  has_many :atividades, :through => :entidade_equipamento_atividades, :uniq => true

  accepts_nested_attributes_for :entidade_equipamento_atividades,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  validates :nome,        :presence => true, :length => { :minimum => 2 }
  validates :cep,         :presence => true, :length => { :minimum => 8, :maximum => 8 }
  validates :contato,     :presence => true
  validates :descricao,   :presence => true
  validates :logradouro,  :presence => true, :length => { :minimum => 4 }
  validates :estado,      :presence => true
  validates :cidade,      :presence => true
  validates :imagem,      :presence => true
  validates :email,       :presence => true, :email_format => {:message => ' Formato Incorreto'}

  acts_as_gmappable :process_geocoding => true

  def gmaps4rails_address
    "#{self.logradouro}, #{self.cep}, #{self.cidade}, #{self.estado}, Brasil"
  end

  def gmaps4rails_infowindow
    "
      <div class=\"infowindow\">
        <div class=\"infowindow-titulo\">
          <h3>#{self.nome[0..64]}</h3>
          <p>#{self.descricao.truncate(256)}</p>
          <br/>
          <p><b>Saiba Mais: </b><a href=\"/entidade_equipamentos/#{self.slug}\" target=\"_blank\">#{self.nome.truncate(42)}</a></p>
        </div>
        <div class=\"infowindow-logo\">
          <img src=\"#{self.imagem.url}\" width=\"150\" height=\"150\"/>
        </div>
      </div>
    "
  end

  has_attached_file :imagem,
                    :url => "/system/entidade_equipamentos/images/:id/:basename_:style.:extension",
                    :path => ":rails_root/public/system/entidade_equipamentos/images/:id/:basename_:style.:extension",
                    :styles => { :medium => "300x300>", :thumb => "150x150>" }

  paginates_per 60

  searchable do
    text :nome, :cidade, :estado
    time :created_at
  end

  extend FriendlyId
  friendly_id :nome, use: :slugged
end
