CREATE PROCEDURE dbo.Apu_Proyecto_Material_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Material_Id varchar(17),
	@Apu_Proyecto_Id varchar(17),
	@Costo_Parcial numeric(17, 4),
	@Costo_Otros numeric(17, 4),
	@Costo_Transporte numeric(17, 4),
	@Apu_Indice_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Proyecto_Material] ([Id], [Codigo], [Apu_Material_Id], [Apu_Proyecto_Id], [Costo_Parcial], [Costo_Otros], [Costo_Transporte], [Apu_Indice_Id], [Estado]) VALUES (@Id, @Codigo, @Apu_Material_Id, @Apu_Proyecto_Id, @Costo_Parcial, @Costo_Otros, @Costo_Transporte, @Apu_Indice_Id, @Estado);
	
SELECT Id, Codigo, Apu_Material_Id, Apu_Proyecto_Id, Costo_Parcial, Costo_Otros, Costo_Transporte, Apu_Indice_Id, Estado FROM Apu_Proyecto_Material WHERE (Id = @Id)