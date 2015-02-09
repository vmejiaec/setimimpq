
create FUNCTION [dbo].[Pla_Mov_ValorInicial_ByPla_Poa_Id]
(
	@p_Pla_Poa_Id int
)
RETURNS numeric(17,4)
BEGIN
	declare @v_ValorInicial numeric(17,4)
	-- Se considera como valor inicial al que tiene el orden = 0
	select @v_ValorInicial = Valor from Pla_Mov where Pla_Poa_Id = @p_Pla_Poa_Id and Orden = 0
	
	select @v_ValorInicial = isnull(@v_ValorInicial,0)
	
    RETURN @v_ValorInicial
END