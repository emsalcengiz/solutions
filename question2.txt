'''
 Bu üç oyuncunun toplam oyun süreleri dakika cinsinden hesaplayan sorgu
'''
SELECT TOP 3 [user], DATEDIFF(MINUTE,[start_date],[end_date]) as minute_spent from scores order by score desc