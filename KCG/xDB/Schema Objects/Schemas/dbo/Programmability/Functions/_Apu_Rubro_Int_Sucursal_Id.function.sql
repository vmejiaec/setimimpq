CREATE FUNCTION [dbo].[_Apu_Rubro_Int_Sucursal_Id]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_int_sucursal_id varchar(17)

	select  @v_int_sucursal_id = 
            (select int_sucursal_id 
             from  apu_rubro
             where id = @p_apu_rubro_id)

    RETURN  @v_int_sucursal_id

END


