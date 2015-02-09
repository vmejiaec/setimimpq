create FUNCTION [dbo].[_Dic_Dominio_Id]
(
	@p_dic_campo_id varchar(17),
    @p_dominio char(3)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_dic_dominio_id varchar(17)

	select  @v_dic_dominio_id = 
            (select id 
             from  dic_dominio
             where dic_campo_id = @p_dic_campo_id
             and   dominio = @p_dominio)

    RETURN  @v_dic_dominio_id

END






