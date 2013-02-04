# encoding: utf-8

class FotosController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  def create
    @foto = Foto.new(params[:foto])
    @dados = EntidadeEquipamento.find(@foto.entidade_equipamento_id)

    respond_to do |format|
      if @foto.save
        format.html { redirect_to entidade_equipamento_fotos_path, notice: 'A Foto foi adicionada com Sucesso.' }
        format.json { render json: entidade_equipamento_fotos_path, status: :created, location: @dados }
      else
        format.html { render action: "new" }
        format.json { render json: @dados.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @foto = Foto.new
    @dados = EntidadeEquipamento.find(params[:entidade_equipamento_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @foto }
    end
  end

  def edit
    @foto = Foto.find(params[:id])
    @dados = EntidadeEquipamento.find(@foto.entidade_equipamento_id)

    return false if !owner_verify(@dados, entidade_equipamentos_url)
  end

  def update
    @foto = Foto.find(params[:id])
    @dados = EntidadeEquipamento.find(@foto.entidade_equipamento_id)

    respond_to do |format|
      if @foto.update_attributes(params[:foto])
        format.html { redirect_to entidade_equipamento_fotos_path, notice: 'A Foto foi atualizada com Sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dados.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @dados = EntidadeEquipamento.find(params[:entidade_equipamento_id])
    @fotos = Foto.where("entidade_equipamento_id = #{@dados.id}")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dados }
    end
  end

  def destroy
    @foto = Foto.find(params[:id])
    @dados = EntidadeEquipamento.find(@foto.entidade_equipamento_id)

    return false if !owner_verify(@dados, entidade_equipamento_url)

    @foto.destroy

    respond_to do |format|
      format.html { redirect_to entidade_equipamento_fotos_path }
      format.json { head :no_content }
    end
  end
end
