CREATE PROCEDURE [dbo].[Apu_Indice_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Int_Empresa_Id varchar(17),
	@Varios varchar(3),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
  
   if (ltrim(rtrim(@varios)) = 'S') begin
	   update apu_indice set varios = 'N' 
       where int_empresa_Id = @int_empresa_id
   end     
 
INSERT INTO [Apu_Indice] 
([Id], [Codigo], [Nombre], [Int_Empresa_Id], [Varios], [Estado]) 
VALUES (@Id, @Codigo, @Nombre, @Int_Empresa_Id, @Varios, @Estado);
	
SELECT Id, Codigo, Nombre, Int_Empresa_Id, Varios, Estado 
FROM Apu_Indice 
WHERE (Id = @Id)
