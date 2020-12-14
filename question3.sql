'''
Minimum skor 0, maksimum skor 100 olmak üzere skorlar 4 eşit aralıktaki dağılımlarını yazdıran sorgu
'''


declare @group1 int  = 0
declare @group2 int  = 0
declare @group3 int  = 0
declare @group4 int  = 0
declare @current_score int = 0

DECLARE RowCursor CURSOR
FOR   
	select score from scores 
open RowCursor
FETCH NEXT FROM RowCursor INTO @current_score
WHILE @@FETCH_STATUS = 0
  BEGIN
    IF(@current_score < 25)
	BEGIN
		SET @group1 += 1
	END
	ELSE IF(@current_score BETWEEN 25 AND 50)
	BEGIN
		SET @group2 += 1
	END
	ELSE IF(@current_score BETWEEN 50 AND 75)
	BEGIN
		SET @group3 += 1
	END
	ELSE
	BEGIN
		SET @group4 += 1
    END
   FETCH NEXT FROM RowCursor INTO @current_score
  END
CLOSE RowCursor
DEALLOCATE RowCursor

Declare @TempTableVariable TABLE(group1 int,group2 int,group3 int,group4 int)
insert into @TempTableVariable values ( @group1,@group2,@group3,@group4);
select group1 as '0-25',group2 as '25-50',group3 as '50-75',group4 as '75-100' from @TempTableVariable 