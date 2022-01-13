module LogsHelper
  # TERMINOLOGY (attributes of Log and Market models)
  #
  # price_bought: USER INPUT in the BUY form
  #             : amount of stocks (in $) the user wants to buy
  #             : can be thought of as COST
  #
  # price_sold: DERIVED value (in $), i.e. volume_sold * selling_price
  #           : can be thought of as REVENUE
  #
  # volume_bought: DERIVED value (in units), i.e. price_bought/buying_price
  #
  # volume_sold: USER INPUT in the SELL form
  #            : amount of stocks (in units) the user wants to sell
  #
  # buying_price: market value (in $ per unit) of the stock if to be bought
  #             : static as of the moment
  #
  # selling_price: market value (in $ per unit) of the stock if to be sold
  #              : static as of the moment
  #
  # volume: amount of stocks (in units) available in the market
  #
  # trades: amount of stocks (in units) bought or sold
  #
  # kind: type of transaction made (either "Buy" or "Sell")
  
  def generate_log_message(log)
    if log.kind == "Buy"
      units = compute_volume_bought(log.price_bought, log.market.buying_price)
      "You bought #{units} units of #{log.market.symbol} stocks at market price of #{convert_to_money(log.market.buying_price)}"
    elsif log.kind == "Sell"
      revenue = compute_price_sold(log.volume_sold, log.market.selling_price)
      "You sold #{log.volume_sold} units of #{log.market.symbol} stocks at market price of #{convert_to_money(log.market.selling_price)}"
    end
  end

  def convert_to_money(number)
    number_to_currency(number, precision: 2, delimiter: ",")
  end

  def compute_volume_bought(price_bought, buying_price)
    (price_bought/buying_price)
  end

  def compute_price_sold(volume_sold, selling_price)
    convert_to_money(volume_sold * selling_price)
  end

  def compute_total_amount(log)
    if log.kind == "Buy"
      "- #{convert_to_money(log.price_bought)}"
    elsif log.kind == "Sell"
      "+ #{compute_price_sold(log.volume_sold, log.market.selling_price)}"
    end
  end
end
