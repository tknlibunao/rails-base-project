module LogsHelper
  def generate_log_message(log)
    if log.kind == "Buy"
      units = compute_volume_bought(log.price_bought, log.market.buying_price)
      "You bought #{units} units of #{log.market.symbol} stocks at market price of $#{log.market.buying_price}"
    elsif log.kind == "Sell"
      revenue = compute_price_sold(log.volume_sold, log.market.selling_price)
      "You sold #{log.volume_sold} units of #{log.market.symbol} stocks at market price of $#{log.market.selling_price}"
    end
  end

  def compute_volume_bought(price_bought, buying_price)
    (price_bought/buying_price).round(4)
  end

  def compute_price_sold(volume_sold, selling_price)
    (volume_sold * selling_price).round(2)
  end

  def compute_total_amount(log)
    if log.kind == "Buy"
      "- $#{log.price_bought}"
    elsif log.kind == "Sell"
      "+ $#{compute_price_sold(log.volume_sold, log.market.selling_price)}"
    end
  end
end
