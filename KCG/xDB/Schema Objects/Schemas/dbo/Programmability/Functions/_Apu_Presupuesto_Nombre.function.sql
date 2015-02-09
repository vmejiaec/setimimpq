CREATE FUNCTION [dbo].[_Apu_Presupuesto_Nombre]
(
	@p_id varchar(17)
)
RETURNS varchar(500)
BEGIN

    declare @v_Apu_Origen_Nombre varchar(500)

	select  @v_Apu_Origen_Nombre = 
            (select Apu_Origen_Nombre
             from  apu_presupuesto
             where Id = @p_id)

    return  @v_Apu_Origen_Nombre

END
















