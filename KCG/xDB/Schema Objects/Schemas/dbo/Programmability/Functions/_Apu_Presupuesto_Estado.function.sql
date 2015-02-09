CREATE FUNCTION [dbo].[_Apu_Presupuesto_Estado]
(
	@p_Apu_Origen_Id varchar(17)
)
RETURNS varchar(3)
BEGIN

    declare @v_Estado varchar(3)

	select  @v_Estado = 
            (select Estado
             from  Apu_Presupuesto
             where Apu_Origen_Id = @p_Apu_Origen_Id)

    return  @v_Estado

END

