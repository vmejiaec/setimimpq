CREATE FUNCTION [dbo].[Par_Razon_Socia_Par_Tip_Ide_Id]
(
	@p_Par_Razon_Social_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Par_Tipo_Identificacion_Id varchar(200)

	select  @v_Par_Tipo_Identificacion_Id = 
            (select Par_Tipo_Identificacion_Id
             from  Par_Razon_Social
             where Id = @p_Par_Razon_Social_Id)

    RETURN  @v_Par_Tipo_Identificacion_Id

END