create FUNCTION [dbo].[_Apu_Proyecto_Porcentaje_Costo_Indirecto_Otros]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS numeric(5,2)
BEGIN
    
    declare 
       @v_porcentaje_costo_indirecto numeric(5,2),
       @v_porcentaje_costo_otros numeric(5,2),
       @v_total numeric(5,2)

    exec @v_porcentaje_costo_indirecto = dbo._Apu_Proyecto_porcentaje_costo_indirecto @p_apu_proyecto_id
    exec @v_porcentaje_costo_otros = dbo._Apu_Proyecto_porcentaje_costo_otros @p_apu_proyecto_id
    
    set @v_total = dbo.__suma_dos_decimales_2 (@v_porcentaje_costo_indirecto,
                                             @v_porcentaje_costo_otros)

    return  @v_total

END


















