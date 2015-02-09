CREATE FUNCTION [dbo].[Par_Razon_Social_Numero]
(
	@p_Par_Razon_Social_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Numero varchar(200)

	select  @v_Numero = 
            (select Numero 
             from  Par_Razon_Social
             where Id = @p_Par_Razon_Social_Id)

    RETURN  @v_Numero

END