CREATE PROCEDURE [dbo].[Com_Procedimiento_Del]
(
	@Original_Id int,
	@Original_Nombre varchar(500),
	@Original_Tipo char(3),
	@Original_Valor_Min numeric(17, 2),
	@Original_Valor_Max numeric(17, 2)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Com_Procedimiento] WHERE (([Id] = @Original_Id) AND ([Nombre] = @Original_Nombre) AND ([Tipo] = @Original_Tipo) AND ([Valor_Min] = @Original_Valor_Min) AND ([Valor_Max] = @Original_Valor_Max))