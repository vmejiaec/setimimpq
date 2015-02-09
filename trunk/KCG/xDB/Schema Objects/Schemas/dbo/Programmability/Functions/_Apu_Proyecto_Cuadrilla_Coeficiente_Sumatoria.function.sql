CREATE FUNCTION [dbo].[_Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria]
(
	@p_apu_proyecto_id varchar(17)
)    
RETURNS numeric (17,3)
BEGIN
    
    declare 
       @v_total_categoria numeric (17,4),
       @v_total_mano_obra numeric (17,4),
       @v_total numeric (17,4)
       
    select @v_total_categoria =
      (select
             sum(dbo._Apu_Proyecto_Cuadrilla_Coeficiente_Categoria(@p_apu_proyecto_id, apu_categoria_id)) 
    from
          (select apu_categoria_id
           from apu_proyecto_mano_obra
           where apu_proyecto_id = @p_apu_proyecto_id
           group by apu_categoria_id ) Apu_Categoria_Id)

   select @v_total_mano_obra=
     ( select
           sum(dbo._Apu_Proyecto_Cuadrilla_Coeficiente_Mano_Obra(@p_apu_proyecto_id, apu_mano_obra_id))
       from 
		(select Apu_Mano_Obra_Id
		 from Apu_proyecto_mano_obra
		 where apu_categoria_id is null
		 and apu_proyecto_id = @p_apu_proyecto_id
		 Group by Apu_Mano_Obra_Id) Apu_Mano_Obra_Id)

    set @v_total_categoria = isnull(@v_total_categoria,0)

    set @v_total_mano_obra = isnull(@v_total_mano_obra,0)

    exec @v_total = dbo.__Suma_cuatro_decimales_2 @v_total_categoria, @v_total_mano_obra

    RETURN isnull(@v_total,0)

END














