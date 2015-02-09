﻿-- Esta funcion devuelve el valor de coeficiente de acuerdo
-- al indice que se reciba como parametro
CREATE FUNCTION [dbo].[_Apu_Proyecto_Coeficiente]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_indice_id varchar(17)
)
RETURNS numeric(17,3)
BEGIN
    
    declare 
       @v_costo_indice numeric (17,4),
       @v_costo_directo numeric(17,4),
       @v_total numeric (17,4)
    

    exec @v_costo_indice 
         = dbo._apu_proyecto_Indice_Costo  @p_apu_proyecto_id , @p_apu_indice_id
   
    set @v_costo_indice= isnull(@v_costo_indice ,0) 
   exec @v_costo_directo = dbo._Apu_Proyecto_Costo_Directo @p_apu_proyecto_id

   if (isnull(@v_costo_directo,0) = 0) 
       set @v_total = 0
   else
   begin
       
	   exec  @v_total = dbo.__division_tres_decimales @v_costo_indice , @v_costo_directo
   end 

    RETURN  @v_total

END












