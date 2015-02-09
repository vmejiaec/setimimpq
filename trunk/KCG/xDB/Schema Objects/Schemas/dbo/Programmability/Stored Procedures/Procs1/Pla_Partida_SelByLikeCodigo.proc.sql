
CREATE PROCEDURE [dbo].[Pla_Partida_SelByLikeCodigo]
( @p_Codigo varchar(200) )
AS
	SET NOCOUNT ON;
SELECT        
	Id, 
	Codigo, 
	Nombre, 
	Estado
FROM            
	Pla_Partida
where 
	Codigo like @p_Codigo + '%'
order by Codigo