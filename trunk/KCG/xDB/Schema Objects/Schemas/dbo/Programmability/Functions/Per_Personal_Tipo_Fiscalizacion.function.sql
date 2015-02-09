


CREATE FUNCTION [dbo].[Per_Personal_Tipo_Fiscalizacion]
(
	@p_Per_Personal_Id varchar(17)
)
RETURNS varchar(3)
BEGIN
    
    declare @v_Tipo_Fiscalizacion varchar(3)

	select  @v_Tipo_Fiscalizacion = 
            (select Tipo_Fiscalizacion
             from  Per_Personal 
             where Id = @p_Per_Personal_Id)

    RETURN  @v_Tipo_Fiscalizacion

END

















