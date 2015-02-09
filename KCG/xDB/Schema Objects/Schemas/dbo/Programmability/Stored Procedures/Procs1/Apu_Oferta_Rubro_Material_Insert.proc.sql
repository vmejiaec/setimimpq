CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_Material_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Oferta_Rubro_Id varchar(17),
	@Apu_Material_Id varchar(17),
	@Costo numeric(17, 4),
	@Costo_Transporte numeric(17, 4),
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Fecha_UpdateTransporte smalldatetime,
	@UpdateTransporte_Per_Personal_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Oferta_Rubro_Material] 
([Id], [Codigo], [Apu_Oferta_Rubro_Id], [Apu_Material_Id], 
 [Costo], [Costo_Transporte], [Fecha_Creacion], [Creacion_Per_Personal_Id], 
 [Fecha_Update], [Update_Per_Personal_Id], 
 [Fecha_UpdateTransporte], [UpdateTransporte_Per_Personal_Id], [Estado]) 
VALUES (@Id, 
        @Codigo, 
        @Apu_Oferta_Rubro_Id, 
        @Apu_Material_Id, 
        @Costo, 
        @Costo_Transporte, 
        getDate(), 
        @Creacion_Per_Personal_Id, 
        getDate(), 
        @Update_Per_Personal_Id, 
        getDate(), 
        @UpdateTransporte_Per_Personal_Id, 
        @Estado);
	
SELECT Id, Codigo, Apu_Oferta_Rubro_Id, Apu_Material_Id, 
       Costo, Costo_Transporte, Fecha_Creacion, 
       Creacion_Per_Personal_Id, Fecha_Update, Update_Per_Personal_Id, 
       Fecha_UpdateTransporte, UpdateTransporte_Per_Personal_Id, Estado 
FROM Apu_Oferta_Rubro_Material WHERE (Id = @Id)


