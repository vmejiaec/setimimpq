CREATE FUNCTION [dbo].[_Apu_Oferta_Apu_Lugar_Id]
(
	@p_Apu_Oferta_Id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Apu_Lugar_Id varchar(17)

	select  @v_Apu_Lugar_Id = 
            (select Apu_Lugar_Id 
             from  Apu_Oferta
             where Id = @p_Apu_Oferta_Id)

    RETURN  @v_Apu_Lugar_Id

END















