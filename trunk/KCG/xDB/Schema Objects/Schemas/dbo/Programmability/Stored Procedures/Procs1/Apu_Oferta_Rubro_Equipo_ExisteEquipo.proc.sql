CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_Equipo_ExisteEquipo]
(  
   @p_Apu_Equipo_Id varchar (17),
   @p_Apu_Oferta_Rubro_Id varchar(17)
)
AS
	SET NOCOUNT ON;
Select count(*) as ExisteEquipo
From Apu_Oferta_Rubro_Equipo
Where dbo._Apu_Oferta_Rubro_Apu_Oferta_Id(apu_oferta_rubro_id)  = 
      dbo._Apu_Oferta_Rubro_Apu_Oferta_Id(@p_Apu_Oferta_Rubro_Id)
And Apu_Equipo_Id = @p_Apu_Equipo_Id




