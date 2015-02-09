CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Mano_Obra_Ultima_Fecha_Update]
(
	@p_apu_Oferta_rubro_id varchar(17)
)
RETURNS smalldatetime
BEGIN
    
    declare 
      @v_ultima_fecha_update smalldatetime
     
      select  @v_ultima_fecha_update = 
            (select isnull(max (fecha_update),'01/01/1999')
             from  apu_Oferta_rubro_mano_obra 
             where apu_Oferta_rubro_id = @p_apu_Oferta_rubro_id)
      
    RETURN  @v_ultima_fecha_update

END









