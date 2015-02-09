CREATE FUNCTION [dbo].[_Apu_Presupuesto_Apu_Origen_Id]
(
	@p_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Apu_Origen_Id varchar(17)

	select  @v_Apu_Origen_Id = 
            (select Apu_Origen_Id
             from  apu_presupuesto
             where Id = @p_id)

    return  @v_Apu_Origen_Id

END


