CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Mano_Obra_Costo_Diario]
(
	@p_Apu_Proyecto_Rubro_Mano_Obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
       @v_apu_proyecto_id varchar(17),
       @v_apu_Mano_Obra_id varchar(17),
       @v_apu_proyecto_Mano_Obra_id varchar(17),
       @v_costo_total numeric(17,4)
       
   exec @v_apu_proyecto_id 
       = dbo._apu_proyecto_rubro_Mano_Obra_apu_proyecto_id @p_Apu_Proyecto_Rubro_Mano_Obra_id

   exec @v_apu_Mano_Obra_id 
       = dbo._apu_proyecto_rubro_Mano_Obra_apu_Mano_Obra_id @p_Apu_Proyecto_Rubro_Mano_Obra_id

   exec @v_apu_proyecto_Mano_Obra_id
       = dbo._Apu_Proyecto_Mano_Obra_Id1 @v_apu_proyecto_id,  @v_apu_Mano_Obra_id
   
   exec @v_costo_total 
       = dbo._Apu_Proyecto_Mano_Obra_Costo_Total @v_apu_proyecto_Mano_Obra_id          

   return  isnull(@v_Costo_Total,0)

END






