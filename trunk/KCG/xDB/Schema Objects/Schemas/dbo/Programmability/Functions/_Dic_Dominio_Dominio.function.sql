create FUNCTION [dbo].[_Dic_Dominio_Dominio]
(
	@p_dic_dominio_id varchar(17)
)
RETURNS char(3)
BEGIN
    
    declare @v_dominio char(3)

	select  @v_dominio = 
            (select dominio 
             from  dic_dominio 
             where id = @p_dic_dominio_id)

    RETURN  @v_dominio

END












