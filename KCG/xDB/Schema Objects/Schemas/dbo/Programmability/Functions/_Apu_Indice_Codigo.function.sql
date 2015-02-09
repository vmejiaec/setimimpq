CREATE FUNCTION [dbo].[_Apu_Indice_Codigo]
(
	@p_apu_indice_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select isnull(codigo ,'')
             from  apu_indice
             where id = @p_apu_indice_id)

    RETURN  @v_codigo

END













