CREATE FUNCTION [dbo].[_Apu_Presupuesto_Codigo]
(
	@p_id varchar(17)
)
RETURNS varchar(200)
BEGIN

    declare @v_Apu_Origen_Codigo varchar(200)

	select  @v_Apu_Origen_Codigo = 
            (select Apu_Origen_Codigo
             from  apu_presupuesto
             where Id = @p_id)

    return  @v_Apu_Origen_Codigo

END
















