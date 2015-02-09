CREATE PROCEDURE [dbo].Com_Contrato_Oferente_Upd
(
	@Nombre varchar(200),
	@Fecha_Recepcion smalldatetime,
	@Com_Contrato_Id int,
	@Per_Personal_Id_Recibe varchar(17),
	@Comentario varchar(500),
	@Original_Id int,
	@Original_Nombre varchar(200),
	@Original_Fecha_Recepcion smalldatetime,
	@Original_Com_Contrato_Id int,
	@Original_Per_Personal_Id_Recibe varchar(17),
	@Original_Comentario varchar(500),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Com_Contrato_Oferente] SET [Nombre] = @Nombre, [Fecha_Recepcion] = @Fecha_Recepcion, [Com_Contrato_Id] = @Com_Contrato_Id, [Per_Personal_Id_Recibe] = @Per_Personal_Id_Recibe, [Comentario] = @Comentario WHERE (([Id] = @Original_Id) AND ([Nombre] = @Original_Nombre) AND ([Fecha_Recepcion] = @Original_Fecha_Recepcion) AND ([Com_Contrato_Id] = @Original_Com_Contrato_Id) AND ([Per_Personal_Id_Recibe] = @Original_Per_Personal_Id_Recibe) AND ([Comentario] = @Original_Comentario));
	
SELECT Id, Nombre, Fecha_Recepcion, Com_Contrato_Id, Per_Personal_Id_Recibe, Comentario FROM Com_Contrato_Oferente WHERE (Id = @Id)