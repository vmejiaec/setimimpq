CREATE FUNCTION [dbo].[_Apu_Rubro_Costo_Indirecto]
(
	@p_apu_rubro_id varchar(17),
    @p_int_sucursal_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_apu_rubro_costo_directo numeric(17,4),
      @v_apu_parametros_porcentaje_costo_indirecto numeric(5,2),
      @v_costo_indirecto numeric (17,4)

      exec @v_apu_rubro_costo_directo = dbo._apu_rubro_costo_directo @p_apu_rubro_id
      exec @v_apu_parametros_porcentaje_costo_indirecto = dbo._apu_parametros_porcentaje_costo_indirecto @p_int_sucursal_id
      
      exec @v_costo_indirecto = dbo.__porcentaje_cuatro_decimales
                            @v_apu_rubro_costo_directo,
                            @v_apu_parametros_porcentaje_costo_indirecto
 
    RETURN  isnull(@v_costo_indirecto,0)

END

















