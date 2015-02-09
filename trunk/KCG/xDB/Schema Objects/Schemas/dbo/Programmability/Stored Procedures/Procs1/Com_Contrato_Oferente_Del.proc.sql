CREATE PROCEDURE [dbo].Com_Contrato_Oferente_Del
(
	@Original_Id int,
	@Original_Nombre varchar(200),
	@Original_Fecha_Recepcion smalldatetime,
	@Original_Com_Contrato_Id int,
	@Original_Per_Personal_Id_Recibe varchar(17),
	@Original_Comentario varchar(500)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Com_Contrato_Oferente] WHERE (([Id] = @Original_Id) AND ([Nombre] = @Original_Nombre) AND ([Fecha_Recepcion] = @Original_Fecha_Recepcion) AND ([Com_Contrato_Id] = @Original_Com_Contrato_Id) AND ([Per_Personal_Id_Recibe] = @Original_Per_Personal_Id_Recibe) AND ([Comentario] = @Original_Comentario))