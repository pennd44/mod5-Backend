# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Templates
#  = Skill.create(name: "", description: "", category: "", damage: , current_mp:-, required_current_mp: , required_intelligence: )
AreaSkill.destroy_all
AreaItem.destroy_all
EnemySkill.destroy_all
EnemyItem.destroy_all
PlayerSkill.destroy_all
PlayerItem.destroy_all
Skill.destroy_all
Item.destroy_all
Enemy.destroy_all
Job.destroy_all
Area.destroy_all
Player.destroy_all
Map.destroy_all

town=Map.create(name: "Town", image: "https://pbs.twimg.com/media/ESfjJMLUwAAhp0K?format=jpg&name=medium", player_bg:"https://cdn.hipwallpaper.com/i/11/18/9NAXK7.jpg", battle_bg:"https://img.freepik.com/free-vector/box-ring-arena-sports-fighting-cartoon-illustration_1441-3926.jpg?size=626&ext=jpg")
# plains=Map.create(name: "Plains", image: "https://pbs.twimg.com/media/ESfjJMLUwAAhp0K?format=jpg&name=medium", player_bg:"https://cdn.hipwallpaper.com/i/11/18/9NAXK7.jpg", battle_bg:"https://img.freepik.com/free-vector/box-ring-arena-sports-fighting-cartoon-illustration_1441-3926.jpg?size=626&ext=jpg")
player=Player.create(username: "Penn", password:"052798", map_id: town.id, avatar:"https://vignette.wikia.nocookie.net/epicpetwars/images/7/74/Moost.png/revision/latest?cb=20100322180545")

farm=Area.create(name:"Farm", quote:"Farm...Pigs...etc...", map_id: town.id, avatar: "https://vignette.wikia.nocookie.net/epicpetwars/images/e/eb/Foxloom.png/revision/latest?cb=20100322175842", map_image:"https://opengameart.org/sites/default/files/styles/medium/public/stable.png", background:"https://www.ppt-backgrounds.net/thumbs/handicraft-farm-quality-templates-backgrounds.jpg")
armory=Area.create(name:"Store", quote:"Welcome!", map_id: town.id, avatar: "https://vignette.wikia.nocookie.net/epicpetwars/images/6/68/Doofie.png/revision/latest?cb=20100319223641", map_image:"https://opengameart.org/sites/default/files/styles/medium/public/inn.svg_.png", background:"https://i.pinimg.com/originals/02/e4/c8/02e4c8ecf60f073072265246062048d8.jpg")
home=Area.create(name:"Home", quote:"Home sweet home", map_id: town.id, map_image:"https://opengameart.org/sites/default/files/styles/medium/public/sprite0_0.png", background:"https://i.pinimg.com/736x/fb/99/b4/fb99b4ba2f18d2fbcb623ce0437abb52.jpg")
sleep=Job.create(name:"Sleep", current_health:5, current_energy:5, area_id: home.id)
chop_wood=Job.create(name:"Chop Wood", current_energy:-1, money:5, area_id: armory.id, battle_bg:"https://img.freepik.com/free-vector/paint-illustrations-wild-natural_46176-154.jpg?size=626&ext=jpg")
bodyguard=Job.create(name:"Bodygaurd",current_energy:-2,money:15, required_attack:4, area_id: farm.id)
squoom=Enemy.create(username:"Squoom", job_id: bodyguard.id, current_health:12, max_health:12, attack:6, win_money:50,loss_money:-20, win_xp: 5, loss_xp:2, avatar:"https://vignette.wikia.nocookie.net/epicpetwars/images/3/3f/Squishum.png/revision/latest?cb=20090528001434")
tree=Enemy.create(username: "Tree", job_id: chop_wood.id, current_health: 15, max_health:15, attack:0, win_money:15, avatar: "https://i.pinimg.com/originals/d0/04/28/d00428efa0bf27b9edd37eac32dfd2c1.png")
fireball = Skill.create(name: "Fireball", description: "Hawthawthawt", category: "fire", damage:12, current_mp:-2, required_current_mp: 2, required_intelligence:1, icon:"https://listimg.pinclipart.com/picdir/s/67-673815_fire-monitoring-home-security-fireball-icon-clipart.png")
dagger=Item.create(name: "Dagger", attack: 4, category: "sharp", slot:"weapon", image:"https://vignette.wikia.nocookie.net/epicpetwars/images/2/23/Steel_Dagger.png/revision/latest?cb=20100608000638")
sword=Item.create(name: "Sword", attack: 7, category: "sharp", slot:"weapon", required_sharp:1, image: "https://vignette.wikia.nocookie.net/epicpetwars/images/8/87/Cloud_sword-1-.png/revision/latest?cb=20101101180937")
tshirt=Item.create(name: "T-Shirt", defense: 7, category: "light_armor", slot:"armor", image: "https://vignette.wikia.nocookie.net/epicpetwars/images/b/b8/White_Tee.png/revision/latest?cb=20100420174603")
sunglasses=Item.create(name: "Sunglasses", defense: 3, slot:"accessory", image: "https://img1.pnghut.com/5/3/4/Giga9BATrw/brand-vision-care-glasses-black-sunglasses.jpg")
pizza=Item.create(name: "Pizza", current_health: 5, consumable: true, image: "https://icon2.cleanpng.com/20180611/kbo/kisspng-pizza-sticker-cartoon-drawing-clip-art-5b1eece95da355.9346793515287533853836.jpg")

armory_fireball=AreaSkill.create(area_id: armory.id, skill_id: fireball.id, money:-100)


squoom_dagger=EnemyItem.create(enemy_id: squoom.id, item_id:dagger.id, equipped: true)

EnemySkill.create(skill_id:fireball.id, enemy_id:squoom.id)


AreaItem.create(price:100, item_id: dagger.id, area_id: armory.id,)
AreaItem.create(price:400, item_id: sword.id, area_id: armory.id,)
AreaItem.create(price:100, item_id: tshirt.id, area_id: armory.id,)
AreaItem.create(price:150, item_id: sunglasses.id, area_id: armory.id,)
AreaItem.create(price:50, item_id: pizza.id, area_id: armory.id,)



PlayerItem.create(player_id:player.id, item_id:sword.id, equipped:true)

PlayerSkill.create(player_id:player.id, skill_id:fireball.id)





