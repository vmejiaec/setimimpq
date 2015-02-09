CREATE FUNCTION [dbo].[Int_Usuario_Codigo]
(
	@p_Int_Usuario_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Codigo varchar(200)

	select  @v_Codigo = 
            (select Codigo 
             from  Int_Usuario 
             where Id = @p_Int_Usuario_Id)

    RETURN  @v_Codigo

END