
CREATE PROCEDURE [dbo].[Apu_Oferta_Cuadrilla_Diferencia_Select]
AS
	SET NOCOUNT ON;
 declare @p_mano_obra_id varchar(17),
    @p_categoria_id varchar(17)

	set @p_mano_obra_id=  (Select dbo._Apu_Oferta_MaximaCuadrilla(Id)
	    from Apu_Oferta
		Where  ( dbo.__Suma_Dos_Decimales_2 (dbo._Apu_Oferta_Costo_Mano_Obra(id),dbo._Apu_Oferta_Indice_Costo (id,  dbo._Apu_Parametros_Equipo_Apu_Indice_Id(Int_Sucursal_Id)))  <>  dbo._Apu_Oferta_Costo_Mano_Obra_Cuadrilla	(Id)
		or dbo._Apu_Oferta_Cuadrilla_Coeficiente_Sumatoria1(Id) <> 1))


	set @p_categoria_id = (
    Select ISNULL(Apu_Categoria_Id,'NULL')
   	From  Apu_Oferta_mano_obra
	where Apu_Mano_Obra_Id=@p_mano_obra_id)

select 
  id Apu_Oferta_Id,

  Codigo Apu_Oferta_Codigo,
  Nombre Apu_Oferta_Nombre,
  Etapa Apu_Oferta_Etapa,

  CASE @p_categoria_id WHEN  'NULL'
		THEN dbo._Apu_Mano_Obra_Codigo (dbo._Apu_Oferta_MaximaCuadrilla(Id)) 
		ELSE dbo._Apu_Categoria_Codigo(@p_categoria_id) END Apu_Cuadrilla_Codigo, 


  CASE @p_categoria_id WHEN  'NULL'
		THEN  dbo._Apu_Mano_Obra_Nombre (dbo._Apu_Oferta_MaximaCuadrilla(Id)) 
		ELSE dbo._Apu_Categoria_Nombre(@p_categoria_id) END Apu_Cuadrilla_Nombre, 

  0 costo_total,

  0 Costo_Hora,
  0 Numero_trabajadores,
  (1 -  dbo._Apu_Oferta_Cuadrilla_Coeficiente_Sumatoria1	(Id) ) Coeficiente
from Apu_Oferta