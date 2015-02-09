

CREATE FUNCTION [dbo].[Apr_Documento_Nombre]
(
	@p_Apr_Documento_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_Nombre varchar(500)

	select  @v_Nombre = 
            (select Nombre 
             from  Apr_Documento 
             where Id = @p_Apr_Documento_Id)

    RETURN  @v_Nombre

END













