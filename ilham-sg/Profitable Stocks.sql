SELECT pt.stock_code 
FROM price_tomorrow AS pt
INNER JOIN price_today AS today
ON pt.stock_code = today.stock_code
WHERE pt.price > today.price
ORDER BY pt.stock_code ASC;