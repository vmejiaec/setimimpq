CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_Mano_Obra_ExisteManoObra]
(  
   @p_Apu_Mano_Obra_Id varchar (17),
   @p_Apu_Oferta_Rubro_Id varchar(17)
)
AS
	SET NOCOUNT ON;
Select count(*) as ExisteManoObra
From Apu_Oferta_Rubro_Mano_Obra
Where dbo._Apu_Oferta_Rubro_Apu_Oferta_Id(apu_oferta_rubro_id)  = 
      dbo._Apu_Oferta_Rubro_Apu_Oferta_Id(@p_Apu_Oferta_Rubro_Id)
And Apu_Mano_Obra_Id = @p_Apu_Mano_Obra_Id



