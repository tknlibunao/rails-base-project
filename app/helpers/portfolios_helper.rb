module PortfoliosHelper
  def compute_units(stocks, stock)
    units_bought = ((stocks.where(market_id: stock.market_id).sum(:price_bought).first[1])/stock.market.buying_price)
    units_sold = stocks.where(market_id: stock.market_id).sum(:volume_sold).first[1]
    units_bought - units_sold
  end

  def compute_revenue(units, stock)
    units * stock.market.selling_price
  end

  def get_owned_stocks(logs)
    res = []
    stocks = logs.group(:market_id)

    stocks.each do |stock|
      # units_bought = ((stocks.where(market_id: stock.market_id).sum(:price_bought).first[1])/stock.market.buying_price)
      # units_sold = stocks.where(market_id: stock.market_id).sum(:volume_sold).first[1]
      # units = units_bought - units_sold
      
      units = compute_units(stocks, stock)

      if units > 0
        # revenue = units * stock.market.selling_price
        res << {
          market_id: stock.market_id,
          stock_name: stock.market.stock_name,
          symbol: stock.market.symbol,
          units: units,
          revenue: compute_revenue(units, stock)  }
      end
    end
    res
  end

end
