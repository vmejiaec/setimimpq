CREATE FUNCTION [dbo].[_Apu_Indice_Nombre]
(
	@p_apu_indice_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select Isnull( nombre ,'')
             from  apu_indice 
             where id = @p_apu_indice_id)

    RETURN  @v_nombre

END










