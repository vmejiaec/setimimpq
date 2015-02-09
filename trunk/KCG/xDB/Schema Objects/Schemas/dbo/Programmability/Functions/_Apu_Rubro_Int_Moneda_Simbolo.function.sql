create FUNCTION [dbo].[_Apu_Rubro_Int_Moneda_Simbolo]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS varchar(5)
BEGIN
    
    declare 
          @v_int_moneda_id varchar(17),
          @v_int_sucursal_id varchar(17)  ,
          @v_int_moneda_simbolo varchar(5)

	exec  @v_int_sucursal_id = dbo._apu_rubro_int_sucursal_id @p_apu_rubro_id
    exec  @v_int_moneda_id = dbo._int_sucursal_int_moneda_id @v_int_sucursal_id
    exec  @v_int_moneda_simbolo = dbo._int_moneda_simbolo @v_int_moneda_id

    return   @v_int_moneda_simbolo

END
















