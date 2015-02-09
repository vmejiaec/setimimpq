
create FUNCTION [dbo].[_Apu_Indice_Equipo_Porcentaje]
(
	@p_Apu_Indice_Id varchar(17)
)
RETURNS numeric(5,2)
BEGIN
    
    declare @v_Porcentaje numeric(5,2)

	select  @v_Porcentaje = 
            (select Porcentaje 
             from  Apu_Indice_Equipo
             where Apu_Indice_Id = @p_Apu_Indice_Id)

    RETURN  @v_Porcentaje

END














