

CREATE FUNCTION [dbo].[Dic_Campo_Tipo_Dato]
(
	@p_Dic_Campo_Id varchar(17)
)
RETURNS char(3)
BEGIN
    
    declare @v_Tipo_Dato char(3)

	select  @v_Tipo_Dato = 
            (select Tipo_Dato 
             from  Dic_Campo 
             where Id = @p_Dic_Campo_Id)

    RETURN  @v_Tipo_Dato

END













