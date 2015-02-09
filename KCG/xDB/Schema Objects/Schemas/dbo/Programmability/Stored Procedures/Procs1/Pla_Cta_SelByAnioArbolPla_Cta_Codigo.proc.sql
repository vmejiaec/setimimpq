
create PROCEDURE [dbo].[Pla_Cta_SelByAnioArbolPla_Cta_Codigo]
( @p_Anio varchar(4) , @p_Pla_Cta_Codigo varchar(50)
)
AS
	SET NOCOUNT ON;
	
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

--select @p_Pla_Cta_Codigo, @v_N1, @v_N2, @v_N3, @v_Cta_Codigo_N1, @v_Cta_Codigo_N2,@v_Cta_Codigo_N3

SELECT        Id, Anio, Codigo, Nivel, Nombre, Descripcion, Estado
FROM            Pla_Cta
where Anio = @p_Anio 
and		Codigo in (@v_Cta_Codigo_N1,@v_Cta_Codigo_N2,@v_Cta_Codigo_N3,@v_Cta_Codigo_N4)
order by Codigo
