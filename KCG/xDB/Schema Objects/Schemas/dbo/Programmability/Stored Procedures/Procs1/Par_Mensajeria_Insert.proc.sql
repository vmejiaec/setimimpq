CREATE PROCEDURE dbo.Par_Mensajeria_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Fecha datetime,
	@Int_Usuario_Id varchar(17),
	@Dic_Con_Objeto_Id varchar(17),
	@Id_Origen varchar(17),
	@Descripcion varchar(8000),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Par_Mensajeria] ([Id], [Codigo], [Fecha], [Int_Usuario_Id], [Dic_Con_Objeto_Id], [Id_Origen], [Descripcion], [Estado]) VALUES (@Id, @Codigo, @Fecha, @Int_Usuario_Id, @Dic_Con_Objeto_Id, @Id_Origen, @Descripcion, @Estado);
	
SELECT Id, Codigo, Fecha, Int_Usuario_Id, Dic_Con_Objeto_Id, Id_Origen, Descripcion, Estado FROM Par_Mensajeria WHERE (Id = @Id)