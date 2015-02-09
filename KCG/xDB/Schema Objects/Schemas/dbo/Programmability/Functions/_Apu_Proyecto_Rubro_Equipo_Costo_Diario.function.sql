CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Equipo_Costo_Diario]
(
	@p_Apu_Proyecto_Rubro_Equipo_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
       @v_apu_proyecto_id varchar(17),
       @v_apu_Equipo_id varchar(17),
       @v_apu_proyecto_Equipo_id varchar(17),
       @v_costo_total numeric(17,4)
       
   exec @v_apu_proyecto_id 
       = dbo._apu_proyecto_rubro_Equipo_apu_proyecto_id @p_Apu_Proyecto_Rubro_Equipo_id

   exec @v_apu_Equipo_id 
       = dbo._apu_proyecto_rubro_Equipo_apu_Equipo_id @p_Apu_Proyecto_Rubro_Equipo_id

   exec @v_apu_proyecto_Equipo_id
       = dbo._Apu_Proyecto_Equipo_Id1 @v_apu_proyecto_id,  @v_apu_Equipo_id
   
   exec @v_costo_total 
       = dbo._Apu_Proyecto_Equipo_Costo_Total @v_apu_proyecto_Equipo_id          

   return  isnull(@v_Costo_Total,0)

END






