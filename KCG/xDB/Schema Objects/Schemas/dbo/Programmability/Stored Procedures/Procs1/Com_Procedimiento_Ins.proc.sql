CREATE PROCEDURE [dbo].[Com_Procedimiento_Ins]
(
	@Nombre varchar(500),
	@Tipo char(3),
	@Valor_Min numeric(17, 2),
	@Valor_Max numeric(17, 2)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Com_Procedimiento] ([Nombre], [Tipo], [Valor_Min], [Valor_Max]) VALUES (@Nombre, @Tipo, @Valor_Min, @Valor_Max);
	
SELECT Id, Nombre, Tipo, Valor_Min, Valor_Max FROM Com_Procedimiento WHERE (Id = SCOPE_IDENTITY())