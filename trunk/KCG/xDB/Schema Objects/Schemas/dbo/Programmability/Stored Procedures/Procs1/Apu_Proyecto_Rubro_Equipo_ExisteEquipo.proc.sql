CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Equipo_ExisteEquipo]
(  
   @p_Apu_Equipo_Id varchar (17),
   @p_Apu_Proyecto_Rubro_Id varchar(17)
)
AS
	SET NOCOUNT ON;
Select count(*) as ExisteEquipo
From Apu_proyecto_Rubro_Equipo
Where dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id(apu_proyecto_rubro_id)  = 
      dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id(@p_Apu_Proyecto_Rubro_Id) and
      Apu_Equipo_id=  @p_Apu_Equipo_Id

