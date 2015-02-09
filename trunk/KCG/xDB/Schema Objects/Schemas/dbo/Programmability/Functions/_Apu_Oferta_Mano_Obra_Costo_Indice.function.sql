
-- Suma el total del costo de la mano de obra de un Oferta y un indice 
-- especifico que recibe como parámetro.
CREATE FUNCTION [dbo].[_Apu_Oferta_Mano_Obra_Costo_Indice]
(
	@p_apu_Oferta_id varchar(17),
    @p_apu_indice_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
       @v_total numeric(17,4),
       @v_valor numeric (17,4),
       @v_ManoObraMaquinaria_Apu_Indice varchar(17),
       @v_ManoObra_Apu_Indice_Id varchar(17),
      
       @v_int_sucursal_Id varchar(17)
           
   set @v_total = 0
   
   exec @v_int_sucursal_id 
        = dbo._Apu_Oferta_Int_Sucursal_Id @p_apu_Oferta_id
   
   exec @v_ManoObra_Apu_Indice_Id 
        = dbo._Apu_Parametros_ManoObra_Apu_Indice_Id @v_int_sucursal_id

   if (@p_apu_indice_id = @v_ManoObra_Apu_Indice_Id)
   begin
      exec @v_ManoObraMaquinaria_Apu_Indice 
        = dbo._Apu_Parametros_Equipo_Apu_Indice_Id @v_int_sucursal_id       

      exec @v_valor
        = dbo._Apu_Oferta_Equipo_Costo_Indice 
          @p_apu_Oferta_id, @v_ManoObraMaquinaria_Apu_Indice
      
   end

	select  @v_total = 
        (select 
               sum(dbo._Apu_Oferta_Rubro_Mano_Obra_Costo_x_Cantidad(id))
         from  apu_Oferta_Rubro_Mano_Obra
         where dbo._apu_oferta_rubro_apu_Oferta_id (apu_oferta_rubro_id) = @p_apu_Oferta_id
         and apu_mano_obra_id in 
         (select apu_mano_obra_id
          from apu_oferta_mano_obra
          where apu_oferta_id = @p_apu_oferta_id
          and apu_indice_id =@p_apu_indice_id))

    set @v_total  = @v_total + @v_valor

    RETURN  isnull(@v_total,0)

END












