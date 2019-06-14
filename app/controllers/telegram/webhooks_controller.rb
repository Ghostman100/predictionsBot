
class Telegram::WebhooksController < Telegram::Bot::UpdatesController
  # include Telegram::Bot::UpdatesController::MessageContext

  @@status = "off"

  def start!(*)
    respond_with :message, text: "Hello"
    # Telegram.bot.send_message(chat_id: -274859994, text: "test")
  end

  def on!(*)
    @@status = "on"
    start_predictions
  end

  def off!
    @@status = "off"
  end

  def test!(*)

  end


  def start_predictions(*)
    games = []

  end
end