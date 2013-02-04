# encoding: utf-8

class HomeController < ApplicationController
  def index
    @map = EntidadeEquipamento.all.to_gmaps4rails
  end
end
