CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Material_ExisteMaterial]
(  
   @p_Apu_Material_Id varchar (17),
   @p_Apu_Proyecto_Rubro_Id varchar(17)
)
AS
	SET NOCOUNT ON;
Select count(*) as ExisteMaterial
From Apu_proyecto_Rubro_Material
Where dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id(apu_proyecto_rubro_id)  = 
      dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id(@p_Apu_Proyecto_Rubro_Id) and
      Apu_Material_Id = @p_Apu_Material_Id

