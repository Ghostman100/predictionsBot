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
    r = RestClient.get 'http://tds-vk-1.ru/bets/details.json'
    bets = JSON.parse(r.body)
    games.each do |id|
      bets.each do |bet|
        if bet['raw_data']['status'] == 'success'
          p bet['bet']['is_winning_bet']
          if bet['id'] == id
            if bet['bet']['is_winning_bet'] == true
              ws = Webshot::Screenshot.instance
              ws.capture "http://116.203.50.7:3000/image?value=#{bet['bet']['amount'].to_i}&bet=#{bet['bet']['coef']}&1st_team=#{bet['raw_data']['radiant_team_name']}&2nd_team=#{bet['raw_data']['dire_team_name']}&winner=#{bet['bet']['team']}&map=#{bet['raw_data']['map'][-1]}", "image.png", width: 1024, height: 350
              photo = File.new("image.png", 'r')
              Telegram.bot.request(:forwardMessage, chat_id: -1001277836279, from_chat_id: -1001396010827, message_id: messages[id])
              Telegram.bot.request :sendPhoto, chat_id: -1001277836279,
                                   caption: "Мы поставили #{bet['bet']['amount'].to_i} и выиграли #{(bet['bet']['amount'].to_i * bet['bet']['coef']).round(2)}",
                                   photo: photo,
                                   reply_markup: {
                                       inline_keyboard: [[{text: "Подпишись", url: "tg://resolve?domain=bet_predictions_bot"}]]
                                   }
              photo.close
              messages.delete(id)
              games.delete(id)
              p "true"
            elsif bet['bet']['is_winning_bet'] == nil
            else
              messages.delete(id)
              games.delete(id)
              p "false"
              p bet['bet']['is_winning_bet']
            end
            break
          end
        end
      end
    end
    return games, messages
  end

end
