CREATE PROCEDURE [dbo].Com_DocTec_Upd
(
	@Nombre varchar(200),
	@Original_Id int,
	@Original_Nombre varchar(200),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Com_DocTec] SET [Nombre] = @Nombre WHERE (([Id] = @Original_Id) AND ([Nombre] = @Original_Nombre));
	
SELECT Id, Nombre FROM Com_DocTec WHERE (Id = @Id)