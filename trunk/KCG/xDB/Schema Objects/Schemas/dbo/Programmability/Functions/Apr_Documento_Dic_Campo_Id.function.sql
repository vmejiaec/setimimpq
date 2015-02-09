

CREATE FUNCTION [dbo].[Apr_Documento_Dic_Campo_Id]
(
	@p_Apr_Documento_Id varchar (17)
)
RETURNS varchar (17)
BEGIN
    
    declare @v_Dic_Campo_Id varchar (17)

	select  @v_Dic_Campo_Id = 
            (select Dic_Campo_id 
             from  Apr_Documento 
             where Id = @p_Apr_Documento_Id)

    RETURN  @v_Dic_Campo_Id

END














