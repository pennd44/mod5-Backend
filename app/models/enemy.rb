class Enemy < ApplicationRecord
    has_many :enemy_skills
    has_many :enemy_items
    has_many :skills, through: :enemy_skills
    has_many :items, through: :enemy_items
    belongs_to :job, optional: true


    def adjusted_stats
        # attribute => player.attribute + items.attribute
                # self.equipped_items.map do |eitem|
                #     eitem.item.attributes.keys.each do |attribute|
                
                #        if self.attributes.include?(attribute) && attribute != "id" && attribute != "created_at" && attribute != "updated_at"
                #         self.update_attribute(attribute, self.send(attribute)+eitem.item.send(attribute) )
                #        end
                #     end
                # end
        
        
        
                keys = self.attributes.keys.select do |key|
                    self.equipped_items.any?{|pitem| pitem.item.attributes.include?(key)} && key != id && key != created_at && key != updated_at
                end
        
                adjusted_stats=Hash[keys.map{|key| [key, self.send(key)]}]
        
                self.equipped_items.each do |eitem|
                    itemstats=Hash[keys.map{|key| [key, eitem.item.send(key)]}]
                   adjusted_stats=adjusted_stats.merge(itemstats){|key, oldval, newval| newval+oldval}  
                end
                return adjusted_stats
        
            end
end
