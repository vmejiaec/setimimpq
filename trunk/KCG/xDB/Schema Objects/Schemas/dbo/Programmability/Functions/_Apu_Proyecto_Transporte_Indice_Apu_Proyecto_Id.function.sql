create FUNCTION [dbo].[_Apu_Proyecto_Transporte_Indice_Apu_Proyecto_Id]
(
	@p_apu_proyecto_Transporte_Indice_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_apu_Proyecto_id varchar(17)

	select  @v_apu_Proyecto_Id = 
            (select apu_Proyecto_Id 
             from  apu_proyecto_Transporte_Indice
             where id = @p_apu_proyecto_Transporte_Indice_id)

    RETURN  @v_apu_Proyecto_id

END












