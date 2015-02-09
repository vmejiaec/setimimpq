
create PROCEDURE [dbo].[Pla_Partida_SelById]
( @p_Id int )
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
	Id = @p_Id 