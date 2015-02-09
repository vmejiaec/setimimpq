CREATE FUNCTION [dbo].[_Apu_Indice_Varios]
(
    @p_int_empresa_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_varios varchar(17)

	select  @v_varios = 
            (select id
             from  apu_indice
             where varios = 'S'
             and int_empresa_id = @p_int_empresa_id)

    RETURN  @v_varios

END

















