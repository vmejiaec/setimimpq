
CREATE PROCEDURE [dbo].[Apu_Proyecto_Cuadrilla_Diferencia_Select]
AS
	SET NOCOUNT ON;

 declare @p_mano_obra_id varchar(17),
    @p_categoria_id varchar(17)

	set @p_mano_obra_id=  (Select dbo._Apu_Proyecto_MaximaCuadrilla(Id)
	    from v_Apu_Proyecto
		Where ( dbo.__Suma_Dos_Decimales_2 (v_apu_proyecto.costo_mano_obra,dbo._Apu_Proyecto_Indice_Costo (id,  dbo._Apu_Parametros_Equipo_Apu_Indice_Id(Int_Sucursal_Id)))  <>  dbo._Apu_Proyecto_Costo_Mano_Obra_Cuadrilla	(Id)
		or dbo._Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria1(Id) <> 1))


	set @p_categoria_id = (
    Select ISNULL(Apu_Categoria_Id,'NULL')
   	From  apu_proyecto_mano_obra
	where Apu_Mano_Obra_Id=@p_mano_obra_id)

select 
  id Apu_Proyecto_Id,

  Codigo Apu_proyecto_Codigo,
  Nombre Apu_proyecto_Nombre,
  Etapa Apu_proyecto_Etapa,

  CASE @p_categoria_id WHEN  'NULL'
		THEN dbo._Apu_Mano_Obra_Codigo (dbo._Apu_Proyecto_MaximaCuadrilla(Id)) 
		ELSE dbo._Apu_Categoria_Codigo(@p_categoria_id) END Apu_Cuadrilla_Codigo, 


  CASE @p_categoria_id WHEN  'NULL'
		THEN  dbo._Apu_Mano_Obra_Nombre (dbo._Apu_Proyecto_MaximaCuadrilla(Id)) 
		ELSE dbo._Apu_Categoria_Nombre(@p_categoria_id) END Apu_Cuadrilla_Nombre, 

-- COMENTADO JPU 17/08/2009
--  v_apu_proyecto.costo_mano_obra - v_apu_proyecto.cuadrilla_sumatoria costo_total,
  0 costo_total,

  0 Costo_Hora,
  0 Numero_trabajadores,
  (1 -  dbo._Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria1	(Id) ) Coeficiente
from Apu_Proyecto
