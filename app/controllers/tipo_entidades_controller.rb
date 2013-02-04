# encoding: utf-8

class TipoEntidadesController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :admin_user

  # GET /tipo_entidades
  # GET /tipo_entidades.json
  def index
    @tipo_entidades = TipoEntidade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_entidades }
    end
  end

  # GET /tipo_entidades/1
  # GET /tipo_entidades/1.json
  def show
    @tipo_entidade = TipoEntidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_entidade }
    end
  end

  # GET /tipo_entidades/new
  # GET /tipo_entidades/new.json
  def new
    @tipo_entidade = TipoEntidade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_entidade }
    end
  end

  # GET /tipo_entidades/1/edit
  def edit
    @tipo_entidade = TipoEntidade.find(params[:id])
  end

  # POST /tipo_entidades
  # POST /tipo_entidades.json
  def create
    @tipo_entidade = TipoEntidade.new(params[:tipo_entidade])

    respond_to do |format|
      if @tipo_entidade.save
        format.html { redirect_to @tipo_entidade, notice: 'O Tipo de Entidade foi Criado com Sucesso.' }
        format.json { render json: @tipo_entidade, status: :created, location: @tipo_entidade }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_entidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_entidades/1
  # PUT /tipo_entidades/1.json
  def update
    @tipo_entidade = TipoEntidade.find(params[:id])

    respond_to do |format|
      if @tipo_entidade.update_attributes(params[:tipo_entidade])
        format.html { redirect_to @tipo_entidade, notice: 'O Tipo de Entidade foi Atualizado com Sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_entidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_entidades/1
  # DELETE /tipo_entidades/1.json
  def destroy
    @tipo_entidade = TipoEntidade.find(params[:id])
    @tipo_entidade.destroy

    respond_to do |format|
      format.html { redirect_to tipo_entidades_url }
      format.json { head :no_content }
    end
  end
end
