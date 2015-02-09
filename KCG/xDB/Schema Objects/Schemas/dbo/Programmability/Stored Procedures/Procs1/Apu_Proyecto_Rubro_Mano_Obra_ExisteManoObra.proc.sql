CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Mano_Obra_ExisteManoObra]
(  
   @p_Apu_Mano_Obra_Id varchar (17),
   @p_Apu_Proyecto_Rubro_Id varchar(17)
)
AS
	SET NOCOUNT ON;
Select count(*) as ExisteManoObra
From Apu_proyecto_Rubro_Mano_Obra
Where dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id(apu_proyecto_rubro_id)  = 
      dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id(@p_Apu_Proyecto_Rubro_Id)
and apu_mano_obra_id = @p_Apu_Mano_Obra_Id


