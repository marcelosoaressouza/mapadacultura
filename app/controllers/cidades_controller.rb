# encoding: utf-8

class CidadesController < ApplicationController
  protect_from_forgery

  def index
    @cidades = Cidade.joins(:estado).where("estados.sigla LIKE ?", params[:sigla])

    respond_to do |format|
      format.json  { render :json => @cidades }
    end
  end
end
