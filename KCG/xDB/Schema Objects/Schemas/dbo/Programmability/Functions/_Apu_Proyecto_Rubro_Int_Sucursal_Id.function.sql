create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Int_Sucursal_Id]
(
	@p_apu_proyecto_rubro_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare 
          @v_apu_proyecto_id varchar(17),
          @v_int_sucursal_id varchar(17)

   exec @v_apu_proyecto_id = dbo._Apu_proyecto_rubro_Apu_proyecto_Id @p_apu_proyecto_rubro_id
   exec @v_int_sucursal_id = dbo._Apu_Proyecto_int_sucursal_Id @v_apu_proyecto_id
   
    return  @v_int_sucursal_id

END








