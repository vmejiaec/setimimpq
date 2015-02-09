CREATE FUNCTION [dbo].[Fis_Planilla_Apu_Presupuesto_Id]
(
	@p_Fis_Planilla_Id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Apu_Presupuesto_Id varchar(17)

	select   @v_Apu_Presupuesto_Id = 
            (select Apu_Presupuesto_Id
             from Fis_Planilla
             where Id = @p_Fis_Planilla_Id)

    RETURN  @v_Apu_Presupuesto_Id

END

