'''
Bu üç oyuncuyu aldıkları en yüksek skorlara göre sıralayan sorgu
'''
select top 3 DENSE_RANK() OVER(ORDER BY score desc) [rank],[user],[score] as best_score from scores order by best_score desc