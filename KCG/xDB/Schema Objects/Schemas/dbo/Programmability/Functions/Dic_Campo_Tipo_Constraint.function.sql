

CREATE FUNCTION [dbo].[Dic_Campo_Tipo_Constraint]
(
	@p_Dic_Campo_Id varchar(17)
)
RETURNS char(3)
BEGIN
    
    declare @v_Tipo_Constraint char(3)

	select  @v_Tipo_Constraint = 
            (select Tipo_Constraint 
             from  Dic_Campo 
             where Id = @p_Dic_Campo_Id)

    RETURN  @v_Tipo_Constraint

END













