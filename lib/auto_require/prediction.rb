class Prediction

  # @@status = 'off'
  @@games = []

  def self.get
    a = RestClient.get 'http://tds-vk-1.ru/betting_games/predictions?bankroll=2000&betting_site=ws_gg11_bet'
    JSON.parse(a.body).each do |pr|
      unless @@games.include?(pr['id'])
        Telegram.bot.send_message(chat_id: -1001459280119,
                                  text: "В матче #{pr['radiant_team_name']} - #{pr['dire_team_name']}\n#{pr['map']} #{pr['team']}\n#{pr['bet']}")
        @@games.push(pr['id'])
      end
    end
  end

  def self.result(games, messages)
    p games
    r = RestClient.get 'http://tds-vk-1.ru/bets/details.json'
    bets = JSON.parse(r.body)
    games.each do |id|
      bets.each do |bet|
        if bet['raw_data']['status'] == 'success'
          p bet['bet']['is_winning_bet']
          if bet['bet']['betting_game_id'] == id
            if bet['bet']['is_winning_bet'] == true
              Telegram.bot.request(:forwardMessage, chat_id: -1001277836279, from_chat_id: -1001396010827, message_id: messages[id])
              Telegram.bot.send_message chat_id: -1001277836279, text: "Мы поставили #{bet['bet']['amount'].to_i} и выигрыли #{bet['bet']['amount'].to_i * bet['bet']['coef']}"
              messages.delete(id)
              games.delete(id)
              p "true"
            elsif bet['bet']['is_winning_bet'] == nil
            else
              messages.delete(id)
              games.delete(id)
              p id
              p "false"
              p bet['bet']['is_winning_bet']
            end
            break
          end
        else
          break
        end
      end
    end
    p games
    return games, messages
  end

end