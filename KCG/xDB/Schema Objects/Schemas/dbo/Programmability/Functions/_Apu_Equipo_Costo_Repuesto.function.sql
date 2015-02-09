CREATE FUNCTION [dbo].[_Apu_Equipo_Costo_Repuesto]
(
	@p_apu_equipo_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
   declare 
          @v_Costo_Repuesto numeric(17,4)
          
   select  @v_costo_repuesto = 
            (select costo_repuesto 
             from  apu_equipo
             where id = @p_apu_equipo_id)

    return  @v_costo_repuesto

END




