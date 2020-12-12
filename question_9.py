from datetime import datetime, timedelta, date
from calendar import monthrange
import os

today = date.today()
nextyear = today.year+1


for x in range(1, 7):
    tarih = date(nextyear, x, 1)
    if tarih.weekday() == 5:
        tarih = tarih + timedelta(days=2)
    if tarih.weekday() == 6:
         tarih = tarih + timedelta(days=1)
    os.mkdir(tarih.strftime("%d-%m-%Y"))
    lastDay = monthrange(tarih.year, tarih.month)[1]
    tarih = date(nextyear, x, lastDay)
    if tarih.weekday() == 5:
        tarih = tarih - timedelta(days=1)
    if tarih.weekday() == 6:
        tarih = tarih - timedelta(days=2)
    os.mkdir(tarih.strftime("%d-%m-%Y"))


