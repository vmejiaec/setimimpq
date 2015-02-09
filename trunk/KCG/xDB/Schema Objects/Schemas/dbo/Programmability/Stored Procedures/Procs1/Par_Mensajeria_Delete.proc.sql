CREATE PROCEDURE dbo.Par_Mensajeria_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Fecha datetime,
	@Original_Int_Usuario_Id varchar(17),
	@Original_Dic_Con_Objeto_Id varchar(17),
	@Original_Id_Origen varchar(17),
	@Original_Descripcion varchar(8000),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Par_Mensajeria] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Fecha] = @Original_Fecha) AND ([Int_Usuario_Id] = @Original_Int_Usuario_Id) AND ([Dic_Con_Objeto_Id] = @Original_Dic_Con_Objeto_Id) AND ([Id_Origen] = @Original_Id_Origen) AND ([Descripcion] = @Original_Descripcion) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))