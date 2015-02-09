CREATE FUNCTION [dbo].[Fis_Planilla_Fecha_Ultimo_Ingreso]
(
	@p_Fis_Planilla_Id varchar(17)
)
RETURNS smalldatetime
BEGIN
    
    declare @v_Fch_Ultimo_Ingreso smalldatetime

	select  @v_Fch_Ultimo_Ingreso = 
            (select Fecha_Ultimo_Ingreso 
             from Fis_Planilla
             where Id = @p_Fis_Planilla_Id)

    RETURN  @v_Fch_Ultimo_Ingreso

END