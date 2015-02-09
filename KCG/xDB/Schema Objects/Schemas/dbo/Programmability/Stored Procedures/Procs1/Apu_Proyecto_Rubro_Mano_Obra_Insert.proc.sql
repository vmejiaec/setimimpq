CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Mano_Obra_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Proyecto_Rubro_Id varchar(17),
	@Apu_Mano_Obra_Id varchar(17),
	@Cantidad numeric(17, 4),
	@Estado char(3),
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Update_Per_Personal_Id varchar(17)
)
AS
	SET NOCOUNT OFF;

INSERT INTO [Apu_Proyecto_Rubro_Mano_Obra] 
([Id], 
 [Codigo], 
 [Apu_Proyecto_Rubro_Id], 
 [Apu_Mano_Obra_Id], 
 [Cantidad], 
 [Estado], 
 [Fecha_Creacion], 
 [Creacion_Per_Personal_Id], 
 [Fecha_Update], 
 [Update_Per_Personal_Id]) 

VALUES (
  @Id, 
  @Codigo, 
  @Apu_Proyecto_Rubro_Id, 
  @Apu_Mano_Obra_Id, 
  @Cantidad, 
  @Estado, 
  GetDate(), 
  @Creacion_Per_Personal_Id, 
  GetDate(), 
  @Update_Per_Personal_Id);
	
SELECT Id, 
       Codigo, 
       Apu_Proyecto_Rubro_Id, 
       Apu_Mano_Obra_Id, 
       Cantidad, 
       Estado, 
       Fecha_Creacion, 
       Creacion_Per_Personal_Id, 
       Fecha_Update, 
       Update_Per_Personal_Id 
FROM Apu_Proyecto_Rubro_Mano_Obra 
WHERE (Id = @Id)



