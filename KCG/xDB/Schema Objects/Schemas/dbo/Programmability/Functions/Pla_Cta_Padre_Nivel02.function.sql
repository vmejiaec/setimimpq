CREATE function [dbo].[Pla_Cta_Padre_Nivel02]
(
	@p_Anio varchar(4) = '2014' , 
	@p_Pla_Cta_Codigo varchar(50)
)
returns varchar(500)
begin
   declare @v_Cta_Padre_Nivel01 varchar(500)
   
	declare @v_Cta_Codigo_N1 varchar(50),
			@v_Cta_Codigo_N2 varchar(50),
			@v_Cta_Codigo_N3 varchar(50),
			@v_Cta_Codigo_N4 varchar(50),
			@v_N1 int,
			@v_N2 int,
			@v_N3 int,
			@v_N4 int

	select @v_N1 = charindex('.', @p_Pla_Cta_Codigo,0)
	select @v_N2 = charindex('.', @p_Pla_Cta_Codigo,@v_N1+1)
	select @v_N3 = charindex('.', @p_Pla_Cta_Codigo,@v_N2+1)
	select @v_N4 = charindex('.', @p_Pla_Cta_Codigo,@v_N3+1)

	select @v_Cta_Codigo_N1 = Left(@p_Pla_Cta_Codigo, @v_N1)
	select @v_Cta_Codigo_N2 = Left(@p_Pla_Cta_Codigo,  @v_N2)
	select @v_Cta_Codigo_N3 = Left(@p_Pla_Cta_Codigo,  @v_N3)
	select @v_Cta_Codigo_N4 = Left(@p_Pla_Cta_Codigo,  @v_N4)

	SELECT @v_Cta_Padre_Nivel01 = CONVERT(varchar, Id) + '<|>' + Codigo + '<|>' + Nombre
	FROM   Pla_Cta
	where  Anio = @p_Anio 
	and		Codigo = @v_Cta_Codigo_N2
   
   return @v_Cta_Padre_Nivel01
end
