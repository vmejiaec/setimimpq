CREATE FUNCTION [dbo].[Par_Razon_Social_Nom_Comercial]
(
	@p_Par_Razon_Social_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_Nombre_Comercial varchar(500)

	select  @v_Nombre_Comercial = 
            (select Nombre_Comercial 
             from  Par_Razon_Social
             where Id = @p_Par_Razon_Social_Id)

    RETURN  @v_Nombre_Comercial

END