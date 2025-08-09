function onTime(interval)
    db.query("DELETE FROM market_offers WHERE expires_at <= NOW()")
    return true
end