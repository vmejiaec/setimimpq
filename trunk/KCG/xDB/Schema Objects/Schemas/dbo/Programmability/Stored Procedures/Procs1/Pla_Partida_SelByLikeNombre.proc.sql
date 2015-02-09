
CREATE PROCEDURE [dbo].[Pla_Partida_SelByLikeNombre]
( @p_Nombre varchar(200) )
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
    UPPER( Nombre ) like  @p_Nombre + '%'
order by Codigo