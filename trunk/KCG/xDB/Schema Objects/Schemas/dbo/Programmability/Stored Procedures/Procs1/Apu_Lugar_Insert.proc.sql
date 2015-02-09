CREATE PROCEDURE [dbo].[Apu_Lugar_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Apu_Provincia_Id varchar(17),
	@Int_Empresa_Id varchar(17),
	@Predeterminada varchar(3),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;

if (ltrim(rtrim(@predeterminada)) = 'S') begin
	   update apu_lugar set predeterminada = 'N' 
       where int_empresa_Id = @int_empresa_id
end     
 
INSERT INTO [Apu_Lugar] ([Id], [Codigo], [Nombre], [Apu_Provincia_Id], [Int_Empresa_Id], [Predeterminada], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Apu_Provincia_Id, @Int_Empresa_Id, @Predeterminada, @Estado);
	
SELECT Id, Codigo, Nombre, Apu_Provincia_Id, Int_Empresa_Id, Predeterminada, Estado FROM Apu_Lugar WHERE (Id = @Id)
