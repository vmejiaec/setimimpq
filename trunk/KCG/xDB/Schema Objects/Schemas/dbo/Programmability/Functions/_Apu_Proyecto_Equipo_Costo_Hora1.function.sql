

CREATE FUNCTION [dbo].[_Apu_Proyecto_Equipo_Costo_Hora1]
(
	@p_Apu_Proyecto_Id varchar(17),
    @p_Apu_Equipo_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
   declare 
          @v_Costo_hora   numeric(17,4)
 
 select  @v_Costo_Hora =
          ( Select dbo.__division_cuatro_decimales(
                   (Costo_Combustible + Costo_Repuesto + Costo_Mantenimiento + Costo_Alquiler + Costo_Otros) ,
                   8)
            from Apu_Proyecto_Equipo
            where apu_proyecto_id = @p_apu_proyecto_id
            and apu_Equipo_id = @p_apu_Equipo_id)

                           
 return  @v_Costo_Hora

END

