CREATE PROCEDURE [dbo].[Per_Personal_Delete]
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Coordinador varchar(3),
	@Original_Tecnico_Costos varchar(3),
	@Original_Int_Empresa_Id varchar(17),
	@IsNull_Jefe_Costos Int,
	@Original_Jefe_Costos varchar(3),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@Original_Par_Razon_Social_Id varchar(17),
	@Original_Tipo_Fiscalizacion char(3),
	@Original_Jefe_Fiscalizacion varchar(3),
	@Original_Fiscalizacion varchar(3),
	@Original_Contratista varchar(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Per_Personal] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Coordinador] = @Original_Coordinador) AND ([Tecnico_Costos] = @Original_Tecnico_Costos) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ((@IsNull_Jefe_Costos = 1 AND [Jefe_Costos] IS NULL) OR ([Jefe_Costos] = @Original_Jefe_Costos)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ([Par_Razon_Social_Id] = @Original_Par_Razon_Social_Id) AND ([Tipo_Fiscalizacion] = @Original_Tipo_Fiscalizacion) AND ([Jefe_Fiscalizacion] = @Original_Jefe_Fiscalizacion) AND ([Fiscalizacion] = @Original_Fiscalizacion) AND ([Contratista] = @Original_Contratista))