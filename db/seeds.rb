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
Job.destroy_all
Skill.destroy_all
Item.destroy_all
Enemy.destroy_all
Area.destroy_all
Player.destroy_all
Map.destroy_all

town=Map.create(name: "Town", image: "https://pbs.twimg.com/media/ESfjJMLUwAAhp0K?format=jpg&name=medium", player_bg:"https://cdn.hipwallpaper.com/i/11/18/9NAXK7.jpg")
player=Player.create(username: "Penn", password:"052798", map_id: town.id)

bodyguard=Job.create(name:"Bodygaurd",current_energy:-2,money:15, required_attack:4)
squoom=Enemy.create(name:"Squoom", job_id: bodyguard.id, current_health:12, max_health:12, attack:6, win_money:50,loss_money:-20, win_xp: 5, loss_xp:2, avatar:"https://vignette.wikia.nocookie.net/epicpetwars/images/3/3f/Squishum.png/revision/latest?cb=20090528001434")

fireball = Skill.create(name: "Fireball", description: "Hawthawthawt", category: "fire", damage:12, current_mp:-2, required_current_mp: 2, required_intelligence:1)
armory=Area.create(name:"Store", quote:"Welcome!", map_id: town.id, avatar: "https://vignette.wikia.nocookie.net/epicpetwars/images/6/68/Doofie.png/revision/latest?cb=20100319223641", map_image:"https://opengameart.org/sites/default/files/styles/medium/public/inn.svg_.png", background:"https://i.pinimg.com/originals/02/e4/c8/02e4c8ecf60f073072265246062048d8.jpg")
dagger=Item.create(name: "dagger", attack: 4, category: "sharp", slot:"weapon")
sword=Item.create(name: "sword", attack: 7, category: "sharp", slot:"weapon", required_sharp:1)

armory_fireball=AreaSkill.create(area_id: armory.id, skill_id: fireball.id, money:-100)


squoom_dagger=EnemyItem.create(enemy_id: squoom.id, item_id:dagger.id, equipped: true)

EnemySkill.create(skill_id:fireball.id, enemy_id:squoom.id)


AreaItem.create(price:100, item_id: dagger.id, area_id: armory.id,)

Job.create(name:"Chop Wood", current_energy:-1, money:5, area_id: armory.id)


PlayerItem.create(player_id:player.id, item_id:sword.id, equipped:true)

PlayerSkill.create(player_id:player.id, skill_id:fireball.id)





