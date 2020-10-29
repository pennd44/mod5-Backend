class Player < ApplicationRecord
    has_secure_password
    has_many :player_skills
    has_many :player_items
    has_many :skills, through: :player_skills
    has_many :items, through: :player_items
    belongs_to :map
    validates :username, uniqueness: {case_sensitive: false}
    validates :password, length: {minimum: 6}, allow_blank: true

    def equipped_items
        self.player_items.select do |p_item|
            p_item.equipped == true
        end
    end
    
    def consumables
        self.player_items.select do |p_item|
            p_item.item.consumable == true
        end
    end
    
    def adjusted_stats
# attribute => player.attribute + items.attribute
        # self.equipped_items.map do |eitem|
        #     eitem.item.attributes.keys.each do |attribute|
        
        #        if self.attributes.include?(attribute) && attribute != "id" && attribute != "created_at" && attribute != "updated_at"
        #         self.update_attribute(attribute, self.send(attribute)+eitem.item.send(attribute) )
        #        end
        #     end
        # end
        return self.username


        # keys = self.attributes.keys.select do |key|
        #     self.equipped_items.any?{|pitem| pitem.item.attributes.include?(key)} && key != id && key != created_at && key != updated_at
        # end

        # adjusted_stats=Hash[keys.map{|key| [key, self.send(key)]}]

        # self.equipped_items.each do |eitem|
        #     itemstats=Hash[keys.map{|key| [key, eitem.item.send(key)]}]
        #    adjusted_stats=adjusted_stats.merge(itemstats){|key, oldval, newval| newval+oldval}
        # end
        # return adjusted_stats

    end
end
