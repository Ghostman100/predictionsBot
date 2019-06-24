class Telegram::WebhooksController < Telegram::Bot::UpdatesController
  # include Telegram::Bot::UpdatesController::MessageContext

  def callback_query(data)
    unless user = User.find_by(user_id: from['id'])
      user = User.create(first_name: from['first_name'], last_name: from['last_name'], username: from['username'], user_id: from['id'])
    end

    user.payments.create()

  end

  def start!(*)
    respond_with :message, text: "Привет"
    message
    # Telegram.bot.send_message(chat_id: -274859994, text: "test")
  end

  def message(*)
    respond_with :message, text: "Привет, что бы купить подписку - перейди по ссылке.", reply_markup: {
        inline_keyboard: [[{text: "Подпишись", callback_data: "test", url: "https://money.yandex.ru/quickpay/shop-widget?writer=seller&targets=#{from['id']}dota2_odds&targets-hint=&default-sum=3000&button-text=11&hint=&successURL=&quickpay=shop&account=4100136132008"}]]
    }
  end

  def test!(*)
    respond_with :message, text: "test",
                 reply_markup: {
                     inline_keyboard: [[{text: "test", callback_data: "test", url: "0.0.0.0:3000/pay"}]]
                 }
  end


  def start_predictions(*)
    games = []

  end
end