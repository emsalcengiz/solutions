'''
Bu tablonun toplam kayıt sayısının "n" olduğunu farz edelim, bu tabloya "part_number" adında yeni bir sütun eklemek istiyoruz.
 Bu alan sayesinde tabloyu daha ufak parçalara bölmeyi planlıyoruz.
  "part_number" alanı kayıtlara rastgele bir şekilde verilecektir. 

  SELECT COUNT(*) FROM scores;  --Returns n 
 
SELECT COUNT(*) FROM scores WHERE part_number = 0; --Returns p 
 
SELECT COUNT(*) FROM scores WHERE part_number IN (0, 1, 2); --Returns 3p 

'''

 declare @user nvarchar(max)
 declare @start_date datetime
 declare @end_date datetime
 declare @score int  = 0
 DECLARE @part int = 0
 Declare @TempTableVariable TABLE([user] nvarchar(max), [start_date] datetime, [end_date] datetime, [score] int, part_number int)
 DECLARE RowCursor CURSOR
FOR   
	select * from scores 
open RowCursor
FETCH NEXT FROM RowCursor INTO @user,@start_date ,@end_date ,@score
WHILE @@FETCH_STATUS = 0
  BEGIN
    set @part = CONVERT(INT, RAND() * 100)
	insert into @TempTableVariable values ( @user,@start_date ,@end_date,@score, @part)
  FETCH NEXT FROM RowCursor INTO  @user,@start_date ,@end_date ,@score
  END
CLOSE RowCursor
DEALLOCATE RowCursor
SELECT * FROM @TempTableVariable WHERE part_number IN (0, 1, 2);