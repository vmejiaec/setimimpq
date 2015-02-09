CREATE FUNCTION [dbo].[_Apu_Proyecto_Int_Moneda_Id]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_int_moneda_id varchar(17)

	select  @v_int_moneda_id = 
            (select int_moneda_id
             from  apu_proyecto
             where id = @p_apu_proyecto_id)

    return  @v_int_moneda_id

END

















