CREATE FUNCTION [dbo].[Fis_Planilla_Numero_Planilla]
(
	@p_Fis_Planilla_Id varchar(17)
)
RETURNS varchar(50)
BEGIN
    
    declare @v_No_Planilla varchar(50)

	select  @v_No_Planilla = 
            (select Numero_Planilla 
             from Fis_Planilla
             where Id = @p_Fis_Planilla_Id)

    RETURN  @v_No_Planilla

END