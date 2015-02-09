CREATE PROCEDURE [dbo].[Apu_Indice_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Int_Empresa_Id varchar(17),
	@Varios varchar(3),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Int_Empresa_Id varchar(17),
	@Original_Varios varchar(3),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;

   if (ltrim(rtrim(@varios)) = 'S') begin
	   update apu_indice set varios = 'N' 
       where int_empresa_Id = @int_empresa_id
   end     
 

UPDATE [Apu_Indice] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Int_Empresa_Id] = @Int_Empresa_Id, [Varios] = @Varios, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ([Varios] = @Original_Varios) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Int_Empresa_Id, Varios, Estado FROM Apu_Indice WHERE (Id = @Id)
