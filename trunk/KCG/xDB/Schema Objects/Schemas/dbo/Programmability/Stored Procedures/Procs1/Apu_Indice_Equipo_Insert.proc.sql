CREATE PROCEDURE dbo.Apu_Indice_Equipo_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Indice_Id varchar(17),
	@Porcentaje numeric(5, 2),
	@Int_Empresa_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Indice_Equipo] ([Id], [Codigo], [Apu_Indice_Id], [Porcentaje], [Int_Empresa_Id], [Estado]) VALUES (@Id, @Codigo, @Apu_Indice_Id, @Porcentaje, @Int_Empresa_Id, @Estado);
	
SELECT Id, Codigo, Apu_Indice_Id, Porcentaje, Int_Empresa_Id, Estado FROM Apu_Indice_Equipo WHERE (Id = @Id)