# encoding: utf-8

class TipoFinalidadesController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :admin_user

  # GET /tipo_finalidades
  # GET /tipo_finalidades.json
  def index
    @tipo_finalidades = TipoFinalidade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_finalidades }
    end
  end

  # GET /tipo_finalidades/1
  # GET /tipo_finalidades/1.json
  def show
    @tipo_finalidade = TipoFinalidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_finalidade }
    end
  end

  # GET /tipo_finalidades/new
  # GET /tipo_finalidades/new.json
  def new
    @tipo_finalidade = TipoFinalidade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_finalidade }
    end
  end

  # GET /tipo_finalidades/1/edit
  def edit
    @tipo_finalidade = TipoFinalidade.find(params[:id])
  end

  # POST /tipo_finalidades
  # POST /tipo_finalidades.json
  def create
    @tipo_finalidade = TipoFinalidade.new(params[:tipo_finalidade])

    respond_to do |format|
      if @tipo_finalidade.save
        format.html { redirect_to @tipo_finalidade, notice: 'Tipo finalidade was successfully created.' }
        format.json { render json: @tipo_finalidade, status: :created, location: @tipo_finalidade }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_finalidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_finalidades/1
  # PUT /tipo_finalidades/1.json
  def update
    @tipo_finalidade = TipoFinalidade.find(params[:id])

    respond_to do |format|
      if @tipo_finalidade.update_attributes(params[:tipo_finalidade])
        format.html { redirect_to @tipo_finalidade, notice: 'Tipo finalidade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_finalidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_finalidades/1
  # DELETE /tipo_finalidades/1.json
  def destroy
    @tipo_finalidade = TipoFinalidade.find(params[:id])
    @tipo_finalidade.destroy

    respond_to do |format|
      format.html { redirect_to tipo_finalidades_url }
      format.json { head :no_content }
    end
  end
end
