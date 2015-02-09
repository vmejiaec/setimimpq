CREATE FUNCTION [dbo].[_Apu_Presupuesto_Cuadrilla_Costo_Total_Estado]
(
	@p_apu_Presupuesto_id varchar(17),
	@p_Estado varchar(3)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_costo_total numeric(17,4)

	select  @v_costo_total = 
            (select round(Sum(isnull(Coeficiente * Costo_Actual,0)),3)
             from  apu_presupuesto_Cuadrilla
             where Apu_Presupuesto_id = @p_apu_Presupuesto_id
			 and Estado=@p_Estado)

    return  isnull(@v_costo_total,0)

END


--Select * FRom Apu_Presupuesto_Cuadrilla


