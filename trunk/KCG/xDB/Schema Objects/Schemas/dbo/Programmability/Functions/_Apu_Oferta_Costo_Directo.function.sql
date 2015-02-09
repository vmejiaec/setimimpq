CREATE FUNCTION [dbo].[_Apu_Oferta_Costo_Directo]
(
	@p_Apu_Oferta_Id varchar(17)
)
RETURNS numeric(17,2)
BEGIN
    
    declare 
      @v_total numeric (17,4)
    
    select @v_total =
     (Select sum(dbo._Apu_Oferta_Rubro_Costo_Total(id))
      from apu_oferta_rubro
      where apu_oferta_id = @p_Apu_Oferta_Id)

   return isnull(@v_total,0)

END





