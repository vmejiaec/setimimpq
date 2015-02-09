CREATE PROCEDURE dbo.Aud_Par_Log_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Int_Sucursal_Id varchar(17),
	@Original_Dic_Contenedor_Id varchar(17),
	@Original_ERR varchar(3),
	@Original_USR varchar(3),
	@Original_DDL varchar(3),
	@Original_EJE varchar(3),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Aud_Par_Log] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ([Dic_Contenedor_Id] = @Original_Dic_Contenedor_Id) AND ([ERR] = @Original_ERR) AND ([USR] = @Original_USR) AND ([DDL] = @Original_DDL) AND ([EJE] = @Original_EJE) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))