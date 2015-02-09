CREATE FUNCTION [dbo].[Fis_Ampliacion_Apu_Presupuesto_Id]
(
	@p_Fis_Ampliacion_Id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Apu_Presupuesto_Id varchar(17)

	select  @v_Apu_Presupuesto_Id = 
            (select Apu_Presupuesto_Id 
             from Fis_Ampliacion
             where Id = @p_Fis_Ampliacion_Id)

    RETURN  @v_Apu_Presupuesto_Id;

END