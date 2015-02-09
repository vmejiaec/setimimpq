
CREATE FUNCTION [dbo].[Pla_Mov_SumaMovs_ByPla_Poa_Id]
(
	@p_Pla_Poa_Id int
)
RETURNS numeric(17,4)
BEGIN
	declare @v_SumaMovs numeric(17,4)
	
	select @v_SumaMovs = sum(tabla.Valor_para_Sumar)
	from (
	select 
		case m.Tipo
		when 'CRE' then + m.Valor -- CREdito positivo (+)
		when 'DEB' then - m.Valor -- DEBito negativo (-)
		end Valor_para_Sumar
	from Pla_Mov m
	where m.Pla_Poa_Id = @p_Pla_Poa_Id
	) tabla
	
	select @v_SumaMovs = isnull(@v_SumaMovs,0)
	
    RETURN @v_SumaMovs
END