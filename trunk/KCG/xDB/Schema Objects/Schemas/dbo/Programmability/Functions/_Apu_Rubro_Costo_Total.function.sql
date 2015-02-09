CREATE FUNCTION [dbo].[_Apu_Rubro_Costo_Total]
(
	@p_apu_rubro_id varchar(17),
    @p_int_sucursal_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_apu_rubro_costo_directo numeric(17,4),
      @v_apu_rubro_costo_indirecto numeric(17,4),
      @v_costo_total numeric (17,4)

   set @v_costo_Total = 0
   exec @v_apu_rubro_costo_directo = dbo._apu_rubro_costo_directo @p_apu_rubro_id
   exec @v_apu_rubro_costo_indirecto = dbo._apu_rubro_costo_indirecto @p_apu_rubro_id, @p_int_sucursal_id
   
   set @v_costo_total =  dbo.__suma_dos_decimales_2 (@v_apu_rubro_costo_directo, @v_apu_rubro_costo_indirecto)
   
   return isnull(@v_costo_total,0)

END



















