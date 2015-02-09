CREATE PROCEDURE dbo.Dic_Con_Campo_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Dic_Con_Objeto_Id varchar(17),
	@Original_Dic_Campo_Id varchar(17),
	@Original_Dic_Rotulo_Id varchar(17),
	@Original_Tool_Dic_Rotulo_Id varchar(17),
	@Original_Ancho int,
	@Original_Orden int,
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Dic_Con_Campo] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Dic_Con_Objeto_Id] = @Original_Dic_Con_Objeto_Id) AND ([Dic_Campo_Id] = @Original_Dic_Campo_Id) AND ([Dic_Rotulo_Id] = @Original_Dic_Rotulo_Id) AND ([Tool_Dic_Rotulo_Id] = @Original_Tool_Dic_Rotulo_Id) AND ([Ancho] = @Original_Ancho) AND ([Orden] = @Original_Orden) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))