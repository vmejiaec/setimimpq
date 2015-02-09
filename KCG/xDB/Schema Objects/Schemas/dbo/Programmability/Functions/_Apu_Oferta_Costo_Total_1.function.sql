create FUNCTION [dbo].[_Apu_Oferta_Costo_Total_1]
(
	@p_apu_Oferta_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_total numeric (17,2);

    select @v_total =
	    (Select isnull(sum(dbo._Apu_Oferta_Rubro_Costo_Total_Indirecto_2(Id)),0)
	    From Apu_Oferta_Rubro
        Where Apu_Oferta_Id = @p_apu_Oferta_id)
	  
    RETURN  @v_total

END




















