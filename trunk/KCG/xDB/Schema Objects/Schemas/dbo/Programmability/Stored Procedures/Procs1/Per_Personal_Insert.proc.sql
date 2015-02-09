CREATE PROCEDURE [dbo].[Per_Personal_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Coordinador varchar(3),
	@Tecnico_Costos varchar(3),
	@Int_Empresa_Id varchar(17),
	@Jefe_Costos varchar(3),
	@Estado char(3),
	@Par_Razon_Social_Id varchar(17),
	@Tipo_Fiscalizacion char(3),
	@Jefe_Fiscalizacion varchar(3),
	@Fiscalizacion varchar(3),
	@Contratista varchar(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Per_Personal] ([Id], [Codigo], [Coordinador], [Tecnico_Costos], [Int_Empresa_Id], [Jefe_Costos], [Estado], [Par_Razon_Social_Id], [Tipo_Fiscalizacion], [Jefe_Fiscalizacion], [Fiscalizacion], [Contratista]) VALUES (@Id, @Codigo, @Coordinador, @Tecnico_Costos, @Int_Empresa_Id, @Jefe_Costos, @Estado, @Par_Razon_Social_Id, @Tipo_Fiscalizacion, @Jefe_Fiscalizacion, @Fiscalizacion, @Contratista);
	
SELECT Id, Codigo, Coordinador, Tecnico_Costos, Int_Empresa_Id, Jefe_Costos, Estado, Par_Razon_Social_Id, Tipo_Fiscalizacion, Jefe_Fiscalizacion, Fiscalizacion, Contratista FROM Per_Personal WHERE (Id = @Id)