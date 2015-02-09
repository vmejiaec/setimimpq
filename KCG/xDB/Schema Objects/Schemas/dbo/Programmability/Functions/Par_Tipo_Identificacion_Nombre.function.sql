

CREATE FUNCTION [dbo].[Par_Tipo_Identificacion_Nombre]
(
	@p_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
   declare @v_Nombre varchar(500)

   select  @v_Nombre = 
            (select Nombre 
             from  Par_Tipo_Identificacion 
             where Id = @p_Id)

    RETURN  @v_Nombre

END




















