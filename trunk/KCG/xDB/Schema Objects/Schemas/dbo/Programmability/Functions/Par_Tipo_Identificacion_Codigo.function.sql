

CREATE FUNCTION [dbo].[Par_Tipo_Identificacion_Codigo]
(
	@p_Par_Tipo_Identificacion_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Codigo varchar(200)

	select  @v_Codigo = 
            (select Codigo 
             from  Par_Tipo_Identificacion
             where Id = @p_Par_Tipo_Identificacion_Id)

    RETURN  @v_Codigo

END


















