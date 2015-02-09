CREATE PROCEDURE dbo.Dic_Con_Objeto_Insert
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
	@Maximo int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Con_Objeto] ([Id], [Codigo], [Dic_Contenedor_Id], [Dic_Objeto_Id], [Orden], [INS], [UPD], [DEL], [Estado], [Maximo]) VALUES (@Id, @Codigo, @Dic_Contenedor_Id, @Dic_Objeto_Id, @Orden, @INS, @UPD, @DEL, @Estado, @Maximo);
	
SELECT Id, Codigo, Dic_Contenedor_Id, Dic_Objeto_Id, Orden, INS, UPD, DEL, Estado, Maximo FROM Dic_Con_Objeto WHERE (Id = @Id)