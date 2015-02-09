CREATE PROCEDURE dbo.Apu_Proyecto_Material_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Material_Id varchar(17),
	@Apu_Proyecto_Id varchar(17),
	@Costo_Parcial numeric(17, 4),
	@Costo_Otros numeric(17, 4),
	@Costo_Transporte numeric(17, 4),
	@Apu_Indice_Id varchar(17),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Material_Id varchar(17),
	@Original_Apu_Proyecto_Id varchar(17),
	@Original_Costo_Parcial numeric(17, 4),
	@Original_Costo_Otros numeric(17, 4),
	@Original_Costo_Transporte numeric(17, 4),
	@IsNull_Apu_Indice_Id Int,
	@Original_Apu_Indice_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apu_Proyecto_Material] SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Material_Id] = @Apu_Material_Id, [Apu_Proyecto_Id] = @Apu_Proyecto_Id, [Costo_Parcial] = @Costo_Parcial, [Costo_Otros] = @Costo_Otros, [Costo_Transporte] = @Costo_Transporte, [Apu_Indice_Id] = @Apu_Indice_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Material_Id] = @Original_Apu_Material_Id) AND ([Apu_Proyecto_Id] = @Original_Apu_Proyecto_Id) AND ([Costo_Parcial] = @Original_Costo_Parcial) AND ([Costo_Otros] = @Original_Costo_Otros) AND ([Costo_Transporte] = @Original_Costo_Transporte) AND ((@IsNull_Apu_Indice_Id = 1 AND [Apu_Indice_Id] IS NULL) OR ([Apu_Indice_Id] = @Original_Apu_Indice_Id)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Apu_Material_Id, Apu_Proyecto_Id, Costo_Parcial, Costo_Otros, Costo_Transporte, Apu_Indice_Id, Estado FROM Apu_Proyecto_Material WHERE (Id = @Id)