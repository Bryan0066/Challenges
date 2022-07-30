class Hand
    attr_accessor :hand

    def initialize(cards_array)
        @hand = cards_array
    end

    def value
        total_value = 0
        @hand.each do |card|
            total_value += card.value 
        end
        total_value
    end

    def print_hand
        player_hand = []
        @hand.each do |card|
            current_card = card.rank.to_s + card.suit.to_s
            player_hand.push(current_card)
        end

        return player_hand.join(",")
    end



end