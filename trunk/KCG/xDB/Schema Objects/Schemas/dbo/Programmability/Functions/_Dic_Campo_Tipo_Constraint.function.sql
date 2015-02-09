create FUNCTION [dbo].[_Dic_Campo_Tipo_Constraint]
(
	@p_dic_campo_id varchar(17)
)
RETURNS char(3)
BEGIN
    
    declare @v_tipo_constraint char(3)

	select  @v_tipo_constraint = 
            (select tipo_constraint 
             from  dic_campo 
             where id = @p_dic_campo_id)

    RETURN  @v_tipo_constraint

END










