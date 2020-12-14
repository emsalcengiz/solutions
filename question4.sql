'''
Skorun oynanan zamanla doğrusal bir şekilde arttığını varsayarsak 
oyuncunun birer saat aralıklarında aldığı skoru hesaplayan sorguyu yazınız.
 ("start_date" ve "end_date" alanlarının bu aralıklar dahilinde olmalıdır.)
'''
 declare @user nvarchar(max)
 declare @start_date datetime
 declare @end_date datetime
 declare @score int  = 0
 Declare @TempTableVariable TABLE([user] nvarchar(max), [start_date] datetime, [end_date] datetime, [score] int)
 declare @time int = 0
 declare @number int = 0

DECLARE RowCursor CURSOR
FOR   
	select * from scores  
open RowCursor
FETCH NEXT FROM RowCursor INTO @user,@start_date ,@end_date ,@score
WHILE @@FETCH_STATUS = 0
  BEGIN
	set @time = DATEDIFF(HOUR,@start_date,@end_date)
	IF(@time > 1)
	BEGIN
	 set @number = @time
	 WHILE(@time > 0)
	 BEGIN
	 insert into @TempTableVariable values ( @user,@start_date ,DATEADD(HOUR,1,@start_date),@score/@number);
	 set @start_date = DATEADD(HOUR,1,@start_date)
	 SET @time -= 1
	 END
	END
	ELSE
	BEGIN
	  insert into @TempTableVariable values ( @user,@start_date ,@end_date,@score);
	END
   FETCH NEXT FROM RowCursor INTO  @user,@start_date ,@end_date ,@score
  END
CLOSE RowCursor
DEALLOCATE RowCursor
select * from @TempTableVariable
