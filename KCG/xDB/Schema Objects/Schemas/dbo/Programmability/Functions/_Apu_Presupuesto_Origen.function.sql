CREATE FUNCTION [dbo].[_Apu_Presupuesto_Origen]
(
	@p_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Origen varchar(3)

	select  @v_Origen = 
            (select Origen
             from  apu_presupuesto
             where Id = @p_id)

    return  @v_Origen

END


