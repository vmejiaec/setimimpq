CREATE FUNCTION [dbo].[_Apu_Oferta_Mano_Obra_Costo_Total_Cuadrilla]
(
	@p_apu_Oferta_id varchar(17),
    @p_apu_mano_obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
            @v_total numeric(17,4),
            @v_int_sucursal_id varchar (17),
			@v_equipo_Apu_Mano_Obra_Id varchar(17),
			@v_equipo_Apu_Indice_Id varchar(17),
			@v_costo_equipo numeric (17,4),
            @v_costo_transporte numeric(17,4),
			@v_costo_material numeric(17,4)

	select  @v_total = 
            (select 
                      isnull(sum(dbo._Apu_Oferta_Rubro_Costo_Mano_Obra1(apu_oferta_id, 
                                                                        apu_mano_obra_id)),0) 
             from  apu_Oferta_mano_obra
             where apu_Oferta_id = @p_apu_Oferta_id
             and apu_mano_obra_id = @p_apu_mano_obra_id)


    exec @v_int_sucursal_id = dbo._Apu_oferta_int_sucursal_id @p_apu_oferta_id

    -- Se obtiene el indice de mano de obra parametrizado en el sistema
    exec @v_equipo_Apu_Mano_Obra_Id = dbo._Apu_Parametros_Apu_Mano_Obra_Id @v_int_sucursal_id

    -- Se verifica si la mano de obra que se recibe como parametro, es la
    -- mano de obra parametrizada en el sistema
    if (@v_equipo_Apu_Mano_Obra_Id = @p_apu_mano_obra_id)
     begin

        exec @v_equipo_Apu_Indice_Id = dbo._Apu_Parametros_Equipo_Apu_Indice_Id @v_int_sucursal_id
        exec @v_costo_equipo = dbo._Apu_oferta_Equipo_Costo_Indice @p_apu_oferta_id, @v_equipo_apu_indice_id
		exec @v_costo_transporte = dbo._Apu_oferta_Transporte_Costo_Indice @p_apu_oferta_id, @v_equipo_apu_indice_id
		exec @v_costo_material = dbo._Apu_oferta_Material_Costo_Indice @p_apu_oferta_id, @v_equipo_apu_indice_id
        set @v_total = @v_total + @v_costo_equipo + @v_costo_transporte + @v_costo_material
     end



    RETURN  isnull(@v_total,0)

END













