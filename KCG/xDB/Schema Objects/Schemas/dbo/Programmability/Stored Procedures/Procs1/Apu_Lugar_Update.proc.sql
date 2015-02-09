CREATE PROCEDURE [dbo].[Apu_Lugar_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Apu_Provincia_Id varchar(17),
	@Int_Empresa_Id varchar(17),
	@Predeterminada varchar(3),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Apu_Provincia_Id varchar(17),
	@Original_Int_Empresa_Id varchar(17),
	@Original_Predeterminada varchar(3),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;

if (ltrim(rtrim(@predeterminada)) = 'S') begin
	   update apu_lugar set predeterminada = 'N' 
       where int_empresa_Id = @int_empresa_id
end     

UPDATE [Apu_Lugar] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Apu_Provincia_Id] = @Apu_Provincia_Id, [Int_Empresa_Id] = @Int_Empresa_Id, [Predeterminada] = @Predeterminada, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Apu_Provincia_Id] = @Original_Apu_Provincia_Id) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ([Predeterminada] = @Original_Predeterminada) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Apu_Provincia_Id, Int_Empresa_Id, Predeterminada, Estado FROM Apu_Lugar WHERE (Id = @Id)
