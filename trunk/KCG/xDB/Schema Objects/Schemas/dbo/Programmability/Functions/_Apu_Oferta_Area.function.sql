CREATE FUNCTION [dbo].[_Apu_Oferta_Area]
(
	@p_apu_Oferta_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_area numeric(17,4)

	select  @v_area = 
            (select area 
             from  apu_Oferta
             where id = @p_apu_Oferta_id)

    return  @v_area

END
