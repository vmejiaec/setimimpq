create FUNCTION [dbo].[_Apu_Rubro_Equipo_Ultima_Fecha_Update]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS smalldatetime
BEGIN
    
    declare 
      @v_ultima_fecha_update smalldatetime
     
      select  @v_ultima_fecha_update = 
            (select isnull(max (fecha_update),'01/01/1999')
             from  apu_rubro_equipo
             where apu_rubro_id = @p_apu_rubro_id)
      
    RETURN  @v_ultima_fecha_update

END







