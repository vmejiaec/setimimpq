

CREATE FUNCTION [dbo].[Int_Empresa_Nombre]
(
	@p_Int_Empresa_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_Nombre varchar(500)

	select  @v_Nombre = 
            (select Nombre 
             from  Int_Empresa 
             where Id = @p_Int_Empresa_Id)

    RETURN  @v_Nombre

END















