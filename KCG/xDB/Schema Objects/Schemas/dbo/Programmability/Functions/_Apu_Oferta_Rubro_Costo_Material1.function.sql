CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Costo_Material1]
(
	@p_Apu_Oferta_Id varchar(17),
    @P_Apu_Material_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo numeric(17,4)

     select  @v_costo = 
             (select sum(dbo._apu_Oferta_rubro_material_costo_x_cantidad (id))
              from  apu_Oferta_rubro_material 
              where dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_id) 
                    = @p_apu_Oferta_id
              and apu_material_id = @p_apu_Material_id)
      
    return  isnull(@v_costo,0)

END












