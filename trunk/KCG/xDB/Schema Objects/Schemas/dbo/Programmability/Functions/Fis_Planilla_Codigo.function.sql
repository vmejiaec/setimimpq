CREATE FUNCTION [dbo].[Fis_Planilla_Codigo]
(
	@p_Fis_Planilla_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select Codigo 
             from Fis_Planilla
             where Id = @p_Fis_Planilla_Id)

    RETURN  @v_codigo

END