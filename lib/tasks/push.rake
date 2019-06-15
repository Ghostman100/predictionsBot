task push: :environment do
  games = []
  messages = {}
  while (true)
    a = RestClient.get 'http://tds-vk-1.ru/betting_games/predictions?bankroll=2000&betting_site=ws_gg11_bet'
    b = JSON.parse(a.body)
    r = RestClient.get 'http://tds-vk-1.ru/bets/details.json'
    bets = JSON.parse(r.body)
    bets.each do |pr|
      if pr['bet'] && pr['bet']['is_winning_bet'] == nil
        unless games.include?(pr['id'])
          m = Telegram.bot.send_message(chat_id: -1001396010827,
                                    text: "В матче #{pr['raw_data']['radiant_team_name']} - #{pr['raw_data']['dire_team_name']}\n#{pr['raw_data']['map']} #{pr['bet']['team']}\n#{pr['bet']['coef']}")
          messages[pr['id']] = m['result']['message_id']
          games.push(pr['id'])
        end
      end
    end
    p games
    games, messages = Prediction.result(games, messages)
    p games
    sleep(10)
  end
end