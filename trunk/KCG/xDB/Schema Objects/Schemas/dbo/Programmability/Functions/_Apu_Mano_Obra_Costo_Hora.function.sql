create FUNCTION [dbo].[_Apu_Mano_Obra_Costo_Hora]
(
	@p_apu_mano_obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
   declare 
          @v_apu_mano_obra_Costo_diario numeric(17,4),
          @v_Costo_hora   numeric(17,4),
          @v_hora int
 
 set @v_hora = 8
 exec @v_apu_mano_obra_Costo_diario = dbo._apu_mano_obra_costo_total @p_apu_mano_obra_id
 exec @v_costo_hora =  dbo.__division_cuatro_decimales @v_apu_mano_obra_Costo_diario, @v_hora
                           
 return  @v_Costo_Hora

END



