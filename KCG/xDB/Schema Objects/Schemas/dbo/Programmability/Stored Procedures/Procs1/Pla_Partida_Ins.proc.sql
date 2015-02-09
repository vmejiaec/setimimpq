
CREATE PROCEDURE [dbo].[Pla_Partida_Ins]
(
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;


INSERT INTO [Pla_Partida] ([Codigo], [Nombre], [Estado]) VALUES (@Codigo, @Nombre, @Estado);
	

select SCOPE_IDENTITY()