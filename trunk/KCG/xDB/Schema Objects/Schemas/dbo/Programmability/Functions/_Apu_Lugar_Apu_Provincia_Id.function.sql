create FUNCTION [dbo].[_Apu_Lugar_Apu_Provincia_Id]
(
	@p_apu_lugar_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_apu_provincia_id varchar(17)

	select  @v_apu_provincia_id = 
            (select apu_provincia_id 
             from  apu_lugar 
             where id = @p_apu_lugar_id)

    RETURN  @v_apu_provincia_id

END








