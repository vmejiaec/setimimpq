CREATE FUNCTION [dbo].[Par_Razon_Social_Codigo]
(
	@p_Par_Razon_Social_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Codigo varchar(200)

	select  @v_Codigo = 
            (select Codigo 
             from  Par_Razon_Social
             where Id = @p_Par_Razon_Social_Id)

    RETURN  @v_Codigo

END