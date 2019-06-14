task push: :environment do
  games = []
  messages = {}
  while (true)
    a = RestClient.get 'http://tds-vk-1.ru/betting_games/predictions?bankroll=2000&betting_site=ws_gg11_bet'
    b = JSON.parse(a.body)
    b.each do |pr|
      unless games.include?(pr['id'])
        m = Telegram.bot.send_message(chat_id: -1001396010827,
                                  text: "В матче #{pr['radiant_team_name']} - #{pr['dire_team_name']}\n#{pr['map']} #{pr['team']}\n#{pr['bet']}")
        messages[pr['id']] = m['result']['message_id']
        games.push(pr['id'])
      end
    end
    p games
    games, messages = Prediction.result(games, messages)
    p games
    sleep(10)
  end
end