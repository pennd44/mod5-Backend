# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Templates
#  = Skill.create(name: "", description: "", category: "", damage: , current_mp:-, required_current_mp: , required_intelligence: )


town=Map.create(name: "Town")
player=Player.create(username: "Penn", password:"052798", map_id: town.id)

bodyguard=Job.create(name:"Bodygaurd",current_energy:-2,money:15, required_attack:4)
squoom=Enemy.create(name:"Squoom", job_id: bodyguard.id, current_health:12, max_health:12, attack:6, win_money:50,loss_money:-20, win_xp: 5, loss_xp:2)

fireball = Skill.create(name: "Fireball", description: "Hawthawthawt", category: "fire", damage:12, current_mp:-2, required_current_mp: 2, required_intelligence:1)
armory=Area.create(name:"Armory", quote:"Welcome!", map_id: town.id)
dagger=Item.create(name: "dagger", attack: 4, category: "sharp", slot:"weapon")
sword=Item.create(name: "sword", attack: 7, category: "sharp", slot:"weapon", required_sharp:1)

armory_fireball=AreaSkill.create(area_id: armory.id, skill_id: fireball.id, money:-100)


squoom_dagger=EnemyItem.create(enemy_id: squoom.id, item_id:dagger.id, equipped: true)

EnemySkill.create(skill_id:fireball.id, enemy_id:squoom.id)


AreaItem.create(price:100, item_id: dagger.id, area_id: armory.id,)

Job.create(name:"Chop Wood", current_energy:-1,money:5)


PlayerItem.create(player_id:player.id, item_id:sword.id, equipped:true)

PlayerSkill.create(player_id:player.id, skill_id:fireball.id)





