CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Int_Sucursal_Id]
(
	@p_Apu_Oferta_Rubro_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare 
      @v_int_sucursal_id varchar(17),
      @v_apu_oferta_id varchar(17)
     
      exec @v_apu_oferta_id = dbo._apu_oferta_rubro_apu_oferta_id @p_apu_oferta_rubro_id
      exec @v_int_sucursal_id = dbo._apu_oferta_int_sucursal_id @v_apu_oferta_id

    return  @v_int_sucursal_id

END















