
CREATE FUNCTION [dbo].[_Apu_Proyecto_Mano_Obra_Costo_Hora1]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_mano_obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
   declare 
          @v_Costo_hora   numeric(17,4)
 
 select  @v_Costo_Hora =
          ( Select dbo.__division_cuatro_decimales(Costo_Diario ,8)
            from apu_proyecto_mano_obra
            where apu_proyecto_id = @p_apu_proyecto_id
            and apu_mano_obra_id = @p_apu_mano_obra_id)

                           
 return  @v_Costo_Hora

END







