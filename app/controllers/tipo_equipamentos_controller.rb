# encoding: utf-8

class TipoEquipamentosController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :admin_user

  # GET /tipo_equipamentos
  # GET /tipo_equipamentos.json
  def index
    @tipo_equipamentos = TipoEquipamento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_equipamentos }
    end
  end

  # GET /tipo_equipamentos/1
  # GET /tipo_equipamentos/1.json
  def show
    @tipo_equipamento = TipoEquipamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_equipamento }
    end
  end

  # GET /tipo_equipamentos/new
  # GET /tipo_equipamentos/new.json
  def new
    @tipo_equipamento = TipoEquipamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_equipamento }
    end
  end

  # GET /tipo_equipamentos/1/edit
  def edit
    @tipo_equipamento = TipoEquipamento.find(params[:id])
  end

  # POST /tipo_equipamentos
  # POST /tipo_equipamentos.json
  def create
    @tipo_equipamento = TipoEquipamento.new(params[:tipo_equipamento])

    respond_to do |format|
      if @tipo_equipamento.save
        format.html { redirect_to @tipo_equipamento, notice: 'O Tipo de Equipamento foi Criado com Sucesso.' }
        format.json { render json: @tipo_equipamento, status: :created, location: @tipo_equipamento }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_equipamentos/1
  # PUT /tipo_equipamentos/1.json
  def update
    @tipo_equipamento = TipoEquipamento.find(params[:id])

    respond_to do |format|
      if @tipo_equipamento.update_attributes(params[:tipo_equipamento])
        format.html { redirect_to @tipo_equipamento, notice: 'O Tipo de Equipamento foi Atualizado com Sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_equipamentos/1
  # DELETE /tipo_equipamentos/1.json
  def destroy
    @tipo_equipamento = TipoEquipamento.find(params[:id])
    @tipo_equipamento.destroy

    respond_to do |format|
      format.html { redirect_to tipo_equipamentos_url }
      format.json { head :no_content }
    end
  end
end
