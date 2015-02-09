CREATE FUNCTION [dbo].[Fis_Planilla_Valor_Iva]
(
	@p_Fis_Planilla_Total_Det numeric(17,2),
	@p_Fis_Planilla_Anticipo_Devengar numeric(17,2),
	@p_Fis_Planilla_Factor_Reajuste numeric(17,4),
	@p_Fis_Planilla_Porcentaje_Iva numeric(17,2)
)
RETURNS numeric(17,2)
BEGIN
    declare 
		@v_Fis_Planilla_Valor_Iva numeric(17,2);
	
	Set @v_Fis_Planilla_Valor_Iva =
	convert(numeric(17,2),round((
				-- Inicio
				(convert(numeric(17,2),
						round(
							(isnull
								(@p_Fis_Planilla_Total_Det,0)
								-
								@p_Fis_Planilla_Anticipo_Devengar
							)
							*
							@p_Fis_Planilla_Factor_Reajuste
						,2)
				)
				-
						(isnull
						(@p_Fis_Planilla_Total_Det,0)
						-
						@p_Fis_Planilla_Anticipo_Devengar
						)
				)
				-- Fin
			* 
			@p_Fis_Planilla_Porcentaje_Iva /100),2))
	
	-- Si el valor del Iva, es menor a CERO,el IVa es cero
	If (@v_Fis_Planilla_Valor_Iva < 0)
		set @v_Fis_Planilla_Valor_Iva = 0;

    RETURN  @v_Fis_Planilla_Valor_Iva

END