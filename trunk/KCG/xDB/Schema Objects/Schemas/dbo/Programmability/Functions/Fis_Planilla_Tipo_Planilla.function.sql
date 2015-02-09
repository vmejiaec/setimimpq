CREATE FUNCTION [dbo].[Fis_Planilla_Tipo_Planilla]
(
	@p_Fis_Planilla_Id varchar(17)
)
RETURNS char(3)
BEGIN
    
    declare @v_Tipo_Planilla char(3)

	select  @v_Tipo_Planilla = 
            (select Tipo_Planilla 
             from Fis_Planilla
             where Id = @p_Fis_Planilla_Id)

    RETURN  @v_Tipo_Planilla

END