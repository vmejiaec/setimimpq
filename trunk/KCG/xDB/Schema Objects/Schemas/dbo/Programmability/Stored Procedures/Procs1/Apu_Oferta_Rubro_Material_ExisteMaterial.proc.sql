CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_Material_ExisteMaterial]
(  
   @p_Apu_Material_Id varchar (17),
   @p_Apu_Oferta_Rubro_Id varchar(17)
)
AS
	SET NOCOUNT ON;
Select count(*) as ExisteMaterial
From Apu_Oferta_Rubro_Material
Where dbo._Apu_Oferta_Rubro_Apu_Oferta_Id(apu_oferta_rubro_id)  = 
      dbo._Apu_Oferta_Rubro_Apu_Oferta_Id(@p_Apu_Oferta_Rubro_Id) and
      Apu_Material_Id = @p_Apu_Material_Id


