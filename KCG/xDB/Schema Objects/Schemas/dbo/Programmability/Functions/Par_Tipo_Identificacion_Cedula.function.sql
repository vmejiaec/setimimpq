CREATE FUNCTION [dbo].[Par_Tipo_Identificacion_Cedula]
(
	@p_Par_Tipo_Identificacion_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Cedula varchar(200)

	select  @v_Cedula = 
            (select Cedula 
             from  Par_Tipo_Identificacion
             where Id = @p_Par_Tipo_Identificacion_Id)

    RETURN  @v_Cedula

END


















