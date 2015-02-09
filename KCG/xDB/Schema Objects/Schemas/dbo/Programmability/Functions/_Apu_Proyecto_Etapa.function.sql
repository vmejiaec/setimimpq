CREATE FUNCTION [dbo].[_Apu_Proyecto_Etapa]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS char(3)
BEGIN
    
    declare @v_etapa char(3)

	select  @v_etapa = 
            (select etapa 
             from  apu_proyecto
             where id = @p_apu_proyecto_id)

    return  @v_etapa

END


















