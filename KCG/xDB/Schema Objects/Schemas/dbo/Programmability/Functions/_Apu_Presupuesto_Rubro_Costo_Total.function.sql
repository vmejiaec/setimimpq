CREATE FUNCTION [dbo].[_Apu_Presupuesto_Rubro_Costo_Total]
(
	@p_Apu_Presupuesto_Id varchar(17),
	@p_Estado varchar(3)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Costo_Total numeric(17,4);

	select  @v_Costo_Total = 
            (select Sum(isnull(Costo_Total,0))
             from  Apu_Presupuesto_Rubro
             where Apu_Presupuesto_Id = @p_Apu_Presupuesto_Id
			 and Estado=@p_Estado)


    return  isnull(@v_Costo_Total,0)

END

