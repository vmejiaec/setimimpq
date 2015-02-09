﻿CREATE FUNCTION [dbo].[_Apu_Titulo_Codigo]
(
	@p_apu_titulo_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apu_titulo
             where id = @p_apu_titulo_id)

    RETURN  @v_codigo

END













