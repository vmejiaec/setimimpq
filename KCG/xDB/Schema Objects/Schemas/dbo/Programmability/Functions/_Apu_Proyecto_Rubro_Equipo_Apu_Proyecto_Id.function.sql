﻿create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Equipo_Apu_Proyecto_Id]
(
	@p_apu_proyecto_rubro_Equipo_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare 
      @v_apu_proyecto_rubro_id varchar(17),
      @v_apu_proyecto_id varchar(17)
      
      exec @v_apu_proyecto_rubro_id 
           = dbo._apu_proyecto_rubro_Equipo_apu_proyecto_rubro_id @p_apu_proyecto_rubro_Equipo_id
      
      exec @v_apu_proyecto_id 
           = dbo._apu_proyecto_rubro_Apu_Proyecto_id @v_apu_proyecto_rubro_id 

    RETURN  @v_apu_proyecto_id

END












