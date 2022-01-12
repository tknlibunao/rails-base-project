module PortfoliosHelper
  def compute_units(log)
    if log.kind == "Buy"
      (log.price_bought/log.market.buying_price).round(4)
    elsif log.kind == "Sell"
      log.volume_sold
    end
  end

  def compute_revenue(log)
    if log.kind == "Buy"
      "-$#{log.price_bought}"
    elsif log.kind == "Sell"
      "+$#{(log.volume_sold * log.market.selling_price).round(2)}"
    end
  end

end
