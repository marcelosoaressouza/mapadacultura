# encoding: utf-8

class TipoNaturezasController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :admin_user

  # GET /tipo_naturezas
  # GET /tipo_naturezas.json
  def index
    @tipo_naturezas = TipoNatureza.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_naturezas }
    end
  end

  # GET /tipo_naturezas/1
  # GET /tipo_naturezas/1.json
  def show
    @tipo_natureza = TipoNatureza.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_natureza }
    end
  end

  # GET /tipo_naturezas/new
  # GET /tipo_naturezas/new.json
  def new
    @tipo_natureza = TipoNatureza.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_natureza }
    end
  end

  # GET /tipo_naturezas/1/edit
  def edit
    @tipo_natureza = TipoNatureza.find(params[:id])
  end

  # POST /tipo_naturezas
  # POST /tipo_naturezas.json
  def create
    @tipo_natureza = TipoNatureza.new(params[:tipo_natureza])

    respond_to do |format|
      if @tipo_natureza.save
        format.html { redirect_to @tipo_natureza, notice: 'Tipo natureza was successfully created.' }
        format.json { render json: @tipo_natureza, status: :created, location: @tipo_natureza }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_natureza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_naturezas/1
  # PUT /tipo_naturezas/1.json
  def update
    @tipo_natureza = TipoNatureza.find(params[:id])

    respond_to do |format|
      if @tipo_natureza.update_attributes(params[:tipo_natureza])
        format.html { redirect_to @tipo_natureza, notice: 'Tipo natureza was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_natureza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_naturezas/1
  # DELETE /tipo_naturezas/1.json
  def destroy
    @tipo_natureza = TipoNatureza.find(params[:id])
    @tipo_natureza.destroy

    respond_to do |format|
      format.html { redirect_to tipo_naturezas_url }
      format.json { head :no_content }
    end
  end
end
