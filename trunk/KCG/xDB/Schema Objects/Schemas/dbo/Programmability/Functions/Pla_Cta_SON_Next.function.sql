CREATE function [dbo].[Pla_Cta_SON_Next]
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
		@v_Hijo varchar(50)

	select @v_Next = CONVERT(varchar, max(x.sec) + 1) + '.'  from
	(
	select codigo, CONVERT(int, left(right(Codigo,3),2)) sec from Pla_Cta
	where 
		Anio = @v_Anio
	and Codigo like @v_Codigo+'__.'
	) x

	if @v_Next is null
	begin
	 select @v_Next= '01.'
	end

	if len(@v_Next) = 2
	begin
		select @v_Next = '0' + @v_Next
	end

	select @v_Codigo_Next = @v_Codigo + @v_Next

	if LEN(@v_Codigo_Next) > 12
	begin
		select @v_Codigo_Next = ''
	end

	return @v_Codigo_Next
end