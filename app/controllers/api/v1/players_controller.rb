class Api::V1::PlayersController < ApplicationController
    # skip_before_action :logged_in?, only: [:create]

    def index
        players=Player.all
        render json: players, include: [:player_items=>{include:[:item]}, :player_skills=>{include:[:skill]}], except: [:created_at, :updated_at], methods: [:adjusted_stats, :equipped_items, :consumables]
    end

    def show
        player=Player.find(params[:id])
        render json: player
    end

    def create
        player=Player.new(player_params)
        if player.valid?
            player.save
            render json: player, include: [:player_skills=>{include:[:skill]}, :player_items=>{include:[:item]}, :map=>{include:[:areas=>{include:[:jobs=>{include: [:enemy]}, :area_items=>{include: [:item]}, :area_skills=>{include: [:skill]}]}]}], methods: [:adjusted_stats, :equipped_items, :consumables], status: :created
        else
            render json: {errors: "failed to create user"}, status: :not_acceptable
        end
    end

    def update
        player=Player.find(params[:id])
        player.update(player_params)
        render json: player, methods: [:adjusted_stats, :equipped_items, :consumables]
    end

    def login
        player = Player.find_by(username: params[:username])
        if player && player.authenticate(params[:password])
            render json: {player: player, token: encode_token({player_id: player.id})}, include: [:player_skills=>{include:[:skill]}, :player_items=>{include:[:item]}, :map=>{include:[:areas=>{include:[:jobs=>{include: [:enemy]}, :area_items=>{include: [:item]}, :area_skills=>{include: [:skill]}]}]}], methods: [:adjusted_stats, :equipped_items, :consumables]
        else
            render json: {error: "Invalid Username or Password"}, status: :unauthorized
        end
    end
        

    def dojob
        player = Player.find(params[:player_id])
        job = Job.find(params[:id])
        player.attributes.keys.each do |key|
            if job.attributes.keys.include?(key)
            job_value = job.send(key)
            end
            unless job_value.nil?||job_value == 0 || key == "id" || key== "created_at" || key== "updated_at"
            
            player_value = player.send(key)
            player.update_attribute(key, player_value+job_value )
            end
        end
        player.save
        render json: player
        

    end

    def unequip_item
        player = Player.find(params[:player_id])
        item = player.equipped_items.find do |item|
            item.slot == params[:slot]
        end
        byebug
        item.equipped = false
        item.save
        render json: player, include: [:player_items=>{include:[:item]}], methods: [:adjusted_stats, :equipped_items]

    end

    def equip_item
        player = Player.find(params[:player_id])
        item = PlayerItem.find(params[:id])
        
        previtem=player.equipped_items.find do |pitem|
            pitem.item.slot == item.item.slot
        end
        if previtem
        previtem.equipped = false
        previtem.save
        end

        item.equipped = true
        player.equipped_items<<item
        item.save
        player.save
        render json: player, include: [:player_items=>{include:[:item]}], methods: [:adjusted_stats, :equipped_items]
    end

    def obtain_item
        player = Player.find(params[:player_id])
        # item = Item.find(params[:id])
        PlayerItem.create(player_id: params[:player_id], item_id: params[:id], equipped: false)
        render json: player, include: [:player_items=>{include:[:item]}]
    end
    
    def learn_skill
        PlayerSkill.create(player_id: params[:player_id], skill_id: params[:id])
        render json: player, include: [:player_skills=>{include:[:skill]}]
    end

    def discard_item
        player = Player.find(params[:player_id])
        pitem = PlayerItem.find(params[:id])
        pitem.delete
    end

    # def getattacked
    #     player = Player.find(params[:player_id])
    #     enemy = Enemy.find(params[:id])
        
    # end

    def win_battle
        player=Player.find(params[:player_id])
        enemy= Enemy.find(params[:id])
        player.update_attribute("money", player.money+enemy.win_money)
        player.update(player_params)
        render json: player
    end

    def lose_battle
        player=Player.find(params[:player_id])
        enemy= Enemy.find(params[:id])
        player.update_attribute("money", player.money+enemy.loss_money)
        player.update(player_params)
        render json: player
    end


    private

    def player_params
        params.require(:player).permit(:username, :password, :avatar, :current_health, :current_energy, :money).with_defaults(map_id:Map.first.id)
    end
end
