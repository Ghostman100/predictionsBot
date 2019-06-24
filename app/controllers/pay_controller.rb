class PayController < ApplicationController

  def index
    sleep(2)
    id = Payment.last.user.user_id
    redirect_to "https://money.yandex.ru/quickpay/shop-widget?writer=seller&targets=#{id}dota2_odds&targets-hint=&default-sum=3000&button-text=11&hint=&successURL=&quickpay=shop&account=4100136132008"
  end

end
