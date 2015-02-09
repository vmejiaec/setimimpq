

CREATE FUNCTION [dbo].[Apr_Documento_Codigo]
(
	@p_Apr_Documento_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Codigo varchar(200)

	select  @v_Codigo = 
            (select Codigo 
             from  Apr_Documento
             where Id = @p_Apr_Documento_Id)

    RETURN  @v_Codigo

END














