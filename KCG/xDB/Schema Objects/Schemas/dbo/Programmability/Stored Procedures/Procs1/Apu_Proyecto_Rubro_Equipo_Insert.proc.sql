﻿CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Equipo_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Proyecto_Rubro_Id varchar(17),
	@Apu_Equipo_Id varchar(17),
	@Cantidad numeric(17, 4),
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Proyecto_Rubro_Equipo] ([Id], [Codigo], [Apu_Proyecto_Rubro_Id], [Apu_Equipo_Id], [Cantidad], [Fecha_Creacion], [Creacion_Per_Personal_Id], [Fecha_Update], [Update_Per_Personal_Id], [Estado]) VALUES (@Id, @Codigo, @Apu_Proyecto_Rubro_Id, @Apu_Equipo_Id, @Cantidad, GetDate(), @Creacion_Per_Personal_Id, getDate(), @Update_Per_Personal_Id, @Estado);
	
SELECT Id, Codigo, Apu_Proyecto_Rubro_Id, Apu_Equipo_Id, Cantidad, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Update, Update_Per_Personal_Id, Estado FROM Apu_Proyecto_Rubro_Equipo WHERE (Id = @Id)
