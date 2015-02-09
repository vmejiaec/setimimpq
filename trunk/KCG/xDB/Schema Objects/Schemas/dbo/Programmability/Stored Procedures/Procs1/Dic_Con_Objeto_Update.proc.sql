CREATE PROCEDURE dbo.Dic_Con_Objeto_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Dic_Contenedor_Id varchar(17),
	@Dic_Objeto_Id varchar(17),
	@Orden int,
	@INS varchar(3),
	@UPD varchar(3),
	@DEL varchar(3),
	@Estado char(3),
	@Maximo int,
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
UPDATE [Dic_Con_Objeto] SET [Id] = @Id, [Codigo] = @Codigo, [Dic_Contenedor_Id] = @Dic_Contenedor_Id, [Dic_Objeto_Id] = @Dic_Objeto_Id, [Orden] = @Orden, [INS] = @INS, [UPD] = @UPD, [DEL] = @DEL, [Estado] = @Estado, [Maximo] = @Maximo WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Dic_Contenedor_Id] = @Original_Dic_Contenedor_Id) AND ([Dic_Objeto_Id] = @Original_Dic_Objeto_Id) AND ([Orden] = @Original_Orden) AND ([INS] = @Original_INS) AND ([UPD] = @Original_UPD) AND ([DEL] = @Original_DEL) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Maximo = 1 AND [Maximo] IS NULL) OR ([Maximo] = @Original_Maximo)));
	
SELECT Id, Codigo, Dic_Contenedor_Id, Dic_Objeto_Id, Orden, INS, UPD, DEL, Estado, Maximo FROM Dic_Con_Objeto WHERE (Id = @Id)