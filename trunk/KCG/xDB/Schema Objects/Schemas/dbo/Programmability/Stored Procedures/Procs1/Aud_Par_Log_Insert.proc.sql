CREATE PROCEDURE dbo.Aud_Par_Log_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Int_Sucursal_Id varchar(17),
	@Dic_Contenedor_Id varchar(17),
	@ERR varchar(3),
	@USR varchar(3),
	@DDL varchar(3),
	@EJE varchar(3),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Aud_Par_Log] ([Id], [Codigo], [Int_Sucursal_Id], [Dic_Contenedor_Id], [ERR], [USR], [DDL], [EJE], [Estado]) VALUES (@Id, @Codigo, @Int_Sucursal_Id, @Dic_Contenedor_Id, @ERR, @USR, @DDL, @EJE, @Estado);
	
SELECT Id, Codigo, Int_Sucursal_Id, Dic_Contenedor_Id, ERR, USR, DDL, EJE, Estado FROM Aud_Par_Log WHERE (Id = @Id)