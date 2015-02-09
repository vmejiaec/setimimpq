

CREATE FUNCTION [dbo].[_Apu_Proyecto_Costo_Total]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS numeric(17,2)
BEGIN
    
    declare 
      @v_total numeric (17,2);

    select @v_total =
	    (Select isnull(sum(dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto(Id)),0)
	    From Apu_Proyecto_Rubro
        Where Apu_Proyecto_Id = @p_apu_proyecto_id)
	  
    RETURN  @v_total

END






















