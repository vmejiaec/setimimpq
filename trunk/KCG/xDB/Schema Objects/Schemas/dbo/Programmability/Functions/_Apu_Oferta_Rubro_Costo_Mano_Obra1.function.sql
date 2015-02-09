CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Costo_Mano_Obra1]
(
	@p_Apu_Oferta_Id varchar(17),
    @P_Apu_Mano_Obra_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo numeric(17,4)

     select  @v_costo = 
             (select sum(dbo._Apu_Oferta_Rubro_Mano_Obra_Costo_x_Cantidad (id))
              from  apu_Oferta_Rubro_Mano_Obra 
              where dbo._apu_oferta_rubro_Apu_Oferta_Id (apu_oferta_rubro_id) = @p_apu_Oferta_id
              and apu_Mano_Obra_id = @p_apu_Mano_Obra_id)
      
    return  isnull(@v_costo,0)

END










