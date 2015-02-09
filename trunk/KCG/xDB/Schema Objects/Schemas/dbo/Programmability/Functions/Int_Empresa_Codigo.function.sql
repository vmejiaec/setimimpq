

CREATE FUNCTION [dbo].[Int_Empresa_Codigo]
(
	@p_Int_Empresa_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Codigo varchar(200)

	select  @v_Codigo = 
            (select Codigo 
             from  Int_Empresa 
             where Id = @p_Int_Empresa_Id)

    RETURN  @v_Codigo

END














