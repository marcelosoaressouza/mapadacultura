# encoding: utf-8

class EntidadeEquipamentosController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy, :evaluate]

  def equipamento
    @entidade_equipamentos = EntidadeEquipamento.where("tipo_equipamento_id = ? AND publicar = true", params[:id])

    @map = @entidade_equipamentos.to_gmaps4rails do |entidade_equipamento, marker|
      marker.title entidade_equipamento.nome + " - " + entidade_equipamento.tipo_equipamento.nome
      marker.picture({ :picture => "#{entidade_equipamento.tipo_equipamento.imagem.url}", :width =>  '24', :height => '24' })
      marker.json({:id => entidade_equipamento.id})
    end

    respond_to do |format|
      format.json { render json: @map }
    end
  end

  def atividade
    @entidade_equipamentos = EntidadeEquipamento.joins(:entidade_equipamento_atividades).where("entidade_equipamento_atividades.atividade_id = ? AND entidade_equipamento_atividades.ordem = 1 AND publicar = true", params[:id])

    @map = @entidade_equipamentos.to_gmaps4rails do |entidade_equipamento, marker|
      marker.title entidade_equipamento.nome + " - " + entidade_equipamento.atividades[0].nome
      marker.picture({ :picture => "#{entidade_equipamento.atividades[0].imagem.url}", :width =>  '24', :height => '24' })
      marker.json({:id => entidade_equipamento.id})
    end

    respond_to do |format|
      format.json { render json: @map }
    end
  end

  def equipamentos
    @entidade_equipamentos = EntidadeEquipamento.order('created_at DESC').where("entidade_equipamentos.tipo_id = 2").page params[:page]

    respond_to do |format|
      format.html
      format.json { render json: @entidade_equipamentos }
    end
  end

  def entidades
    @entidade_equipamentos = EntidadeEquipamento.order('created_at DESC').where("entidade_equipamentos.tipo_id <> 2").page params[:page]

    respond_to do |format|
      format.html
      format.json { render json: @entidade_equipamentos }
    end
  end

  # GET /entidade_equipamentos
  # GET /entidade_equipamentos.json
  def index
    @entidade_equipamentos = EntidadeEquipamento.order('created_at DESC').page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entidade_equipamentos }
    end
  end

  # GET /entidade_equipamentos/evaluate
  # GET /entidade_equipamentos/evaluate.json
  def evaluate
    @entidade_equipamentos = EntidadeEquipamento.order('created_at DESC').where("entidade_equipamentos.publicar = false").page params[:page]

    if !admin_user
     return false
    end

    respond_to do |format|
      format.html
      format.json { render json: @entidade_equipamentos }
    end
  end

  def apresenta
    @entidade_equipamento = EntidadeEquipamento.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @entidade_equipamento }
    end
  end

  # GET /entidade_equipamentos/1
  # GET /entidade_equipamentos/1.json
  def show
    @entidade_equipamento = EntidadeEquipamento.find(params[:id])
    @map = @entidade_equipamento.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entidade_equipamento }
    end
  end

  # GET /entidade_equipamentos/new
  # GET /entidade_equipamentos/new.json
  def new
    @entidade_equipamento = EntidadeEquipamento.new
    @tipos             = Tipo.all
    @tipo_equipamentos = TipoEquipamento.all
    @atividades        = Atividade.all

    if @atividades.empty?
      redirect_to "/atividades/new", :notice => 'Crie ao menos uma Atividade.'
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entidade_equipamento }
    end
  end

  # GET /entidade_equipamentos/1/edit
  def edit
    @entidade_equipamento = EntidadeEquipamento.find(params[:id])
    @tipos             = Tipo.all
    @tipo_equipamentos = TipoEquipamento.all
    @atividades        = Atividade.all

    return false if !owner_verify(@entidade_equipamento, entidade_equipamento_url)
  end

  # POST /entidade_equipamentos
  # POST /entidade_equipamentos.json
  def create
    @entidade_equipamento = EntidadeEquipamento.new(params[:entidade_equipamento])
    @tipos             = Tipo.all
    @tipo_equipamentos = TipoEquipamento.all
    @atividades        = Atividade.all

    respond_to do |format|
      if @entidade_equipamento.save
        format.html { redirect_to @entidade_equipamento, notice: 'Cadastro Efetivado. Aguarde a Publicação.' }
        format.json { render json: @entidade_equipamento, status: :created, location: @entidade_equipamento }
      else
        format.html { render action: "new" }
        format.json { render json: @entidade_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entidade_equipamentos/1
  # PUT /entidade_equipamentos/1.json
  def update
    @entidade_equipamento = EntidadeEquipamento.find(params[:id])
    @tipos             = Tipo.all
    @tipo_equipamentos = TipoEquipamento.all
    @atividades        = Atividade.all

    respond_to do |format|
      if @entidade_equipamento.update_attributes(params[:entidade_equipamento])
        format.html { redirect_to @entidade_equipamento, notice: 'Atualização Efetivada.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entidade_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /entidade_equipamentos/publish/1
  # GEt /entidade_equipamentos/publish/1.json
  def publish
    @entidade_equipamento = EntidadeEquipamento.find(params[:id])

    @entidade_equipamento.publicar = true

    if !admin_user
     return false
    end

    respond_to do |format|
      if @entidade_equipamento.update_attributes(params[:entidade_equipamento])
        format.html { redirect_to @entidade_equipamento, notice: 'Publicado com Sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entidade_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entidade_equipamentos/1
  # DELETE /entidade_equipamentos/1.json
  def destroy
    @entidade_equipamento = EntidadeEquipamento.find(params[:id])

    return false if !owner_verify(@entidade_equipamento, entidade_equipamento_url)

    @entidade_equipamento.destroy

    respond_to do |format|
      format.html { redirect_to entidade_equipamentos_url }
      format.json { head :no_content }
    end
  end

  def search
    @entidade_equipamentos = EntidadeEquipamento.search do
      keywords params[:query]
      paginate :page => params[:page],  :per_page => 60
      order_by :created_at, :desc
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @entidade_equipamentos }
      format.json { render :json => @entidade_equipamentos }
    end
  end
end
