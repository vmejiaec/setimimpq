CREATE FUNCTION [dbo].[_Apu_Presupuesto_Costo_Total]
(
	@p_Apu_Presupuesto_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Costo_Total numeric(17,4);

	select  @v_Costo_Total = 
            (select Costo_Total
             from  Apu_Presupuesto
             where Id = @p_Apu_Presupuesto_Id)

    return  @v_Costo_Total

END

