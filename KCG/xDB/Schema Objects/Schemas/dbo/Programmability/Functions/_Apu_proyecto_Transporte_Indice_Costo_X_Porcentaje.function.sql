
create FUNCTION [dbo].[_Apu_proyecto_Transporte_Indice_Costo_X_Porcentaje]
(
	@p_apu_proyecto_Transporte_Indice_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 

      @v_apu_proyecto_Id varchar(17),
      @v_costo numeric (17,4),
      @v_porcentaje numeric(5,2),
      @v_total numeric(17,4)

      exec @v_apu_proyecto_Id 
           = dbo._apu_proyecto_Transporte_Indice_Apu_Proyecto_Id @p_apu_proyecto_Transporte_Indice_id

      exec @v_costo
           = dbo._Apu_Proyecto_Costo_Transporte  @v_apu_proyecto_Id
      
      exec @v_porcentaje 
           = dbo._apu_proyecto_Transporte_Indice_Porcentaje @p_apu_proyecto_Transporte_Indice_id
      
      exec @v_total 
            = dbo.__porcentaje_cuatro_decimales @v_costo, @v_porcentaje
      
    return  @v_total

END

















