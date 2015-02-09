create FUNCTION [dbo].[_Apu_Parametros_Equipo_Apu_Indice_Id]
(
	@p_int_sucursal_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Equipo_Apu_Indice_Id varchar(17)

	select  @v_Equipo_Apu_Indice_Id = 
            (select Equipo_Apu_Indice_Id
             from  apu_parametros 
             where int_sucursal_id = @p_int_sucursal_id)

    RETURN  @v_Equipo_Apu_Indice_Id

END









