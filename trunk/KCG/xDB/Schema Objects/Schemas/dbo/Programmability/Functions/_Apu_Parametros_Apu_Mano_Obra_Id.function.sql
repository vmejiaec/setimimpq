create FUNCTION [dbo].[_Apu_Parametros_Apu_Mano_Obra_Id]
(
	@p_int_sucursal_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Apu_Mano_Obra_Id varchar(17)

	select  @v_Apu_Mano_Obra_Id = 
            (select Apu_Mano_Obra_Id
             from  apu_parametros 
             where int_sucursal_id = @p_int_sucursal_id)

    RETURN  @v_Apu_Mano_Obra_Id

END



