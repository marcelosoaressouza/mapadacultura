# encoding: utf-8

class QuestionarioBasicoEntidadesController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  # GET /questionario_basico_entidades
  # GET /questionario_basico_entidades.json
  def index
    @entidade_equipamento = EntidadeEquipamento.find(params[:entidade_equipamento_id])
    @questionario_basico_entidades = QuestionarioBasicoEntidade.where("entidade_equipamento_id = #{@entidade_equipamento.id}").limit(1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questionario_basico_entidades }
    end
  end

  # GET /questionario_basico_entidades/1
  # GET /questionario_basico_entidades/1.json
  def show
    @questionario_basico_entidade = QuestionarioBasicoEntidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questionario_basico_entidade }
    end
  end

  # GET /questionario_basico_entidades/new
  # GET /questionario_basico_entidades/new.json
  def new
    @questionario_basico_entidade = QuestionarioBasicoEntidade.new
    @entidade_equipamento = EntidadeEquipamento.find(params[:entidade_equipamento_id])

    return false if !owner_verify(@entidade_equipamento, entidade_equipamentos_url)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questionario_basico_entidade }
    end
  end

  # GET /questionario_basico_entidades/1/edit
  def edit
    @questionario_basico_entidade = QuestionarioBasicoEntidade.find(params[:id])
    @entidade_equipamento = EntidadeEquipamento.find(params[:entidade_equipamento_id])

    return false if !owner_verify(@entidade_equipamento, entidade_equipamentos_url)
  end

  # POST /questionario_basico_entidades
  # POST /questionario_basico_entidades.json
  def create
    @questionario_basico_entidade = QuestionarioBasicoEntidade.new(params[:questionario_basico_entidade])
    @entidade_equipamento = EntidadeEquipamento.find(params[:entidade_equipamento_id])
    
    respond_to do |format|
      if @questionario_basico_entidade.save
        format.html { redirect_to entidade_equipamento_questionario_basico_entidades_path(@entidade_equipamento), notice: 'O Questionario foi Respondido com Sucesso.' }
        format.json { render json: @questionario_basico_entidade, status: :created, location: @questionario_basico_entidade }
      else
        format.html { render action: "new" }
        format.json { render json: @entidade_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questionario_basico_entidades/1
  # PUT /questionario_basico_entidades/1.json
  def update
    @questionario_basico_entidade = QuestionarioBasicoEntidade.find(params[:id])
    @entidade_equipamento = EntidadeEquipamento.find(params[:entidade_equipamento_id])

    respond_to do |format|
      if @questionario_basico_entidade.update_attributes(params[:questionario_basico_entidade])
        format.html { redirect_to entidade_equipamento_questionario_basico_entidades_path(@entidade_equipamento), notice: 'O Questionario foi Atualizado com Sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entidade_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionario_basico_entidades/1
  # DELETE /questionario_basico_entidades/1.json
  def destroy
    @questionario_basico_entidade = QuestionarioBasicoEntidade.find(params[:id])
    @entidade_equipamento = EntidadeEquipamento.find(params[:entidade_equipamento_id])

    return false if !owner_verify(entidade, entidade_equipamentos_url)

    @questionario_basico_entidade.destroy

    respond_to do |format|
      format.html { redirect_to entidade_equipamento_questionario_basico_entidades_url }
      format.json { head :no_content }
    end
  end
end
