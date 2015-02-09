create FUNCTION [dbo].[_Apu_Rubro_Transporte_Ultima_Fecha_Update]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS smalldatetime
BEGIN
    
    declare 
      @v_ultima_fecha_update smalldatetime
     
      select  @v_ultima_fecha_update = 
            (select isnull(max (fecha_updatetransporte),'01/01/1999')
             from  apu_rubro_material 
             where apu_rubro_id = @p_apu_rubro_id)
      
    RETURN  @v_ultima_fecha_update

END






