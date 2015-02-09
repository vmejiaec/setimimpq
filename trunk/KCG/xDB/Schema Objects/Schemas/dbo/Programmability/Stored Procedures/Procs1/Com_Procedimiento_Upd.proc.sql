CREATE PROCEDURE [dbo].[Com_Procedimiento_Upd]
(
	@Nombre varchar(500),
	@Tipo char(3),
	@Valor_Min numeric(17, 2),
	@Valor_Max numeric(17, 2),
	@Original_Id int,
	@Original_Nombre varchar(500),
	@Original_Tipo char(3),
	@Original_Valor_Min numeric(17, 2),
	@Original_Valor_Max numeric(17, 2),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Com_Procedimiento] SET [Nombre] = @Nombre, [Tipo] = @Tipo, [Valor_Min] = @Valor_Min, [Valor_Max] = @Valor_Max WHERE (([Id] = @Original_Id) AND ([Nombre] = @Original_Nombre) AND ([Tipo] = @Original_Tipo) AND ([Valor_Min] = @Original_Valor_Min) AND ([Valor_Max] = @Original_Valor_Max));
	
SELECT Id, Nombre, Tipo, Valor_Min, Valor_Max FROM Com_Procedimiento WHERE (Id = @Id)