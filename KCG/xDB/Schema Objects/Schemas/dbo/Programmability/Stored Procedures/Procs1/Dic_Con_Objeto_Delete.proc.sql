CREATE PROCEDURE dbo.Dic_Con_Objeto_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Dic_Contenedor_Id varchar(17),
	@Original_Dic_Objeto_Id varchar(17),
	@Original_Orden int,
	@Original_INS varchar(3),
	@Original_UPD varchar(3),
	@Original_DEL varchar(3),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Maximo Int,
	@Original_Maximo int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Dic_Con_Objeto] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Dic_Contenedor_Id] = @Original_Dic_Contenedor_Id) AND ([Dic_Objeto_Id] = @Original_Dic_Objeto_Id) AND ([Orden] = @Original_Orden) AND ([INS] = @Original_INS) AND ([UPD] = @Original_UPD) AND ([DEL] = @Original_DEL) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Maximo = 1 AND [Maximo] IS NULL) OR ([Maximo] = @Original_Maximo)))