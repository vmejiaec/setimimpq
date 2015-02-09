
CREATE FUNCTION [dbo].[_Apu_Oferta_MaximaCuadrilla]
(
	@p_apu_oferta_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Id varchar(17)

select @v_Id =              
	(select max(Apu_Mano_Obra_Id)
	from  apu_oferta_mano_obra
	where apu_oferta_id = @p_apu_oferta_id
	And dbo._Apu_Oferta_Mano_Obra_Costo_Total_Cuadrilla(apu_oferta_id, Apu_mano_Obra_Id) = (
    Select max(dbo._Apu_Oferta_Mano_Obra_Costo_Total_Cuadrilla(apu_oferta_id, Apu_mano_Obra_Id))
    From apu_oferta_mano_obra
    where apu_oferta_id = @p_apu_oferta_id))
	

    RETURN  @v_Id

END




