CREATE PROCEDURE [dbo].Com_Contrato_Oferente_Ins
(
	@Nombre varchar(200),
	@Fecha_Recepcion smalldatetime,
	@Com_Contrato_Id int,
	@Per_Personal_Id_Recibe varchar(17),
	@Comentario varchar(500)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Com_Contrato_Oferente] ([Nombre], [Fecha_Recepcion], [Com_Contrato_Id], [Per_Personal_Id_Recibe], [Comentario]) VALUES (@Nombre, @Fecha_Recepcion, @Com_Contrato_Id, @Per_Personal_Id_Recibe, @Comentario);
	
SELECT Id, Nombre, Fecha_Recepcion, Com_Contrato_Id, Per_Personal_Id_Recibe, Comentario FROM Com_Contrato_Oferente WHERE (Id = SCOPE_IDENTITY())