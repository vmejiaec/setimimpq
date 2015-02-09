CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Apu_Oferta_Id]
(
	@p_Apu_Oferta_Rubro_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare 
      @v_apu_Oferta_id varchar(17)
     
      select  @v_apu_Oferta_id =
            (select apu_Oferta_id
             from  apu_Oferta_rubro
             where id = @p_apu_Oferta_rubro_id)
      
    return  @v_apu_Oferta_id

END













