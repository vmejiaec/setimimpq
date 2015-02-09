CREATE FUNCTION [dbo].[_Apu_Oferta_Int_Sucursal_Id]
(
	@p_apu_Oferta_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_int_sucursal_id varchar(17)

	select  @v_int_sucursal_id = 
            (select int_sucursal_id
             from  apu_Oferta
             where id = @p_apu_Oferta_id)

    return  @v_int_sucursal_id

END



















