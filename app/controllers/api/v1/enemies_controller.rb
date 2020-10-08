class Api::V1::EnemiesController < ApplicationController
    def index
        enemies=Enemy.all
        render json: enemies, except: [:created_at, :updated_at]
    end

    def show
        enemy=Enemy.find(params[:id])
        render json: enemy
    end

    def update
        enemy=Enemy.find(params[:id])
        enemy.update(enemy_params)
        render json: enemy
    end

    private

    def enemy_params
        params.permit(:current_health, :max_health, :attack, :defense, :win_money, :loss_money, :name)
    end


end
