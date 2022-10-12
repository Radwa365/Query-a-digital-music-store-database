Query 1: Which album has the most sold songs?

SELECT al.Title, SUM(il.UnitPrice * il.Quantity) AS Album_Sales
FROM Album al
JOIN Track t
ON al.AlbumId = t.AlbumId
JOIN InvoiceLine il
ON il.TrackId = t.TrackId
JOIN Invoice i
ON i.InvoiceId = il.InvoiceId
GROUP BY 1
ORDER BY 2 DESC;


Query 2: What are the top 10 artists who write rock music?

Select al.ArtistId, at.Name, COUNT(*) As Songs
FROM Artist at
JOIN Album al
ON at.ArtistId = al.ArtistId
JOIN Track t
ON al.AlbumId = t.AlbumId
JOIN Genre g
ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 10;


Query 3: Who are the top 10 profit artists?

SELECT at.Name, SUM(il.Quantity * il.UnitPrice) AS AmountSpent
FROM Artist at
JOIN Album al
ON at.ArtistId = al.ArtistId
JOIN Track t
ON t.AlbumId = al.AlbumId
JOIN InvoiceLine il
ON il.TrackId = t.TrackId
JOIN Invoice i
ON i.InvoiceId = il.InvoiceId
JOIN Customer c
ON i.CustomerId = c.CustomerId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;



Query 4: In which country jazz music is popular?

SELECT c.Country, g.Name, Count(*) AS Songs
FROM Genre g
JOIN Track t
ON g.GenreId = t.GenreId
JOIN InvoiceLine il
ON il.TrackId = t.TrackId
JOIN Invoice i
ON i.InvoiceId = il.InvoiceId
JOIN Customer c
ON c.CustomerId = i.CustomerId
WHERE g.Name = 'Jazz'
GROUP BY 1, 2
ORDER BY 3 DESC;