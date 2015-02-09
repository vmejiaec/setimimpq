
-- Costo unitario, incluido costos indirectos y costos otros
CREATE FUNCTION [dbo].[_Apu_Proyecto_Pres_Rubro_Costo_Unitario]
(
	@p_apu_origen_id varchar(17),
	@p_apu_rubro_id varchar(17)
)
RETURNS numeric (17,2)
BEGIN
    
    declare 
       @v_material numeric(17,4),
      @v_transporte numeric(17,4),
      @v_mano_obra numeric(17,4),
      @v_equipo numeric(17,4),
      @v_total numeric (17,4),
      @v_int_sucursal_Id varchar(17),
      @v_ManoObra_Apu_Indice_Id varchar(17),
      @v_Equipo_Apu_Indice_Id varchar(17),
	  @v_costo_indice numeric (17,4),
	  @v_porcentaje numeric(5,2)	
              
  

  SET @v_material = 
			( Select isnull( sum(isnull(  dbo.__multiplicar_cuatro_decimales_2(Costo_Diario,Cantidad) ,0)),0)
			from Apu_Presupuesto_Rubro_Insumo
			where Apu_Origen_Id  = @p_apu_origen_id
				  AND  Insumo='MAT' 
				  and apu_rubro_id = @p_apu_rubro_id)

  SET @v_transporte=
			( Select isnull( sum(isnull( dbo.__multiplicar_cuatro_decimales_2(Costo_Diario,Cantidad),0)),0)
			from Apu_Presupuesto_Rubro_Insumo
			where Apu_Origen_Id  = @p_apu_origen_id
				  AND  Insumo='TRA' 
				  and apu_rubro_id = @p_apu_rubro_id)


   SET @v_mano_obra=
			( Select isnull( sum(isnull( dbo.__multiplicar_cuatro_decimales_2(Costo_Diario,Rendimiento),0)),0)
			from Apu_Presupuesto_Rubro_Insumo
			where Apu_Origen_Id  = @p_apu_origen_id
				  AND  Insumo='MAN' 
				  and apu_rubro_id = @p_apu_rubro_id)


   SET @v_equipo=
			( Select isnull( sum(isnull(  dbo.__multiplicar_cuatro_decimales_2(Costo_Diario,Rendimiento)  ,0)),0)
			from Apu_Presupuesto_Rubro_Insumo
			where Apu_Origen_Id  = @p_apu_origen_id
				  AND  Insumo='EQU' 
				  and apu_rubro_id = @p_apu_rubro_id
			 )
   exec @v_porcentaje =  dbo._Apu_Presupuesto_Porcentaje @p_apu_origen_id
   
 

   exec @v_total = dbo.__suma_cuatro_decimales_4 
                    @v_material, 
                    @v_transporte,
                    @v_mano_obra,
                    @v_equipo
  
   exec @v_porcentaje =  dbo.__Porcentaje_Cuatro_Decimales @v_total,@v_porcentaje

   set 	@v_total=@v_total+@v_porcentaje

  return  @v_total

END


