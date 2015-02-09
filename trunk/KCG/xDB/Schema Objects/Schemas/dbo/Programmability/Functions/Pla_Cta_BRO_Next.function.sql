CREATE function [dbo].[Pla_Cta_BRO_Next]
(
	@v_Anio varchar(4),
	@v_Codigo varchar(50)
)
returns varchar(50)
as
begin
	declare 
		@v_Next varchar(50),
		@v_Codigo_Next varchar(50),
		@v_Padre varchar(50)

	select @v_Padre = left(@v_Codigo,LEN(@v_Codigo)-3)

	select @v_Next = CONVERT(varchar, MAX(x.sec)+1) + '.' from 
	(
		select y.Codigo, y.sec from
		(
			select Codigo, CONVERT(int, left(right(Codigo,3),2)) sec from Pla_Cta
			where Codigo like @v_Padre + '__.'
			and Anio = @v_Anio
		) y
		where y.Codigo like @v_Padre + '__.'
	) x

	if LEN(@v_Next) = 2
	begin
		select @v_Next = '0'+@v_Next
	end 

	select @v_Codigo_Next = @v_Padre + @v_Next

	return @v_Codigo_Next
end