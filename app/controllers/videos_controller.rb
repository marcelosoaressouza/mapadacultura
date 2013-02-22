# encoding: utf-8

class VideosController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
  layout nil, :only => :view

  def create
    @video = Video.new(params[:video])
    @dados = EntidadeEquipamento.find(@video.entidade_equipamento_id)

    respond_to do |format|
      if @video.save
        format.html { redirect_to entidade_equipamento_videos_path, notice: 'O Vídeo foi adicionada com Sucesso.' }
        format.json { render json: entidade_equipamento_videos_path, status: :created, location: @dados }
      else
        format.html { render action: "new" }
        format.json { render json: @dados.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @video = Video.new
    @dados = EntidadeEquipamento.find(params[:entidade_equipamento_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  def edit
    @video = Video.find(params[:id])
    @dados = EntidadeEquipamento.find(@video.entidade_equipamento_id)

    return false if !owner_verify(@dados, entidade_equipamentos_url)
  end

  def update
    @video = Video.find(params[:id])
    @dados = EntidadeEquipamento.find(@video.entidade_equipamento_id)

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to entidade_equipamento_videos_path, notice: 'O Vídeo foi atualizado com Sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dados.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @dados = EntidadeEquipamento.find(params[:entidade_equipamento_id])
    @videos = Video.where("entidade_equipamento_id = #{@dados.id}")

    respond_to do |format|
      format.html
      format.json { render json: @dados }
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @dados = EntidadeEquipamento.find(@video.entidade_equipamento_id)

    return false if !owner_verify(@dados, entidade_equipamento_url)

    @video.destroy

    respond_to do |format|
      format.html { redirect_to entidade_equipamento_videos_path }
      format.json { head :no_content }
    end
  end

  # GET /videos/view/1
  def view
    @video = Video.find(params[:video_id])
    render :layout => false
  end
end
