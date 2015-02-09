CREATE PROCEDURE [dbo].[Apu_Parametros_Select]
(
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT    
	Id, 
	Codigo, 
	Equipo_Apu_Indice_Id, 
	ManoObra_Apu_Indice_Id, 
	Porcentaje_Costo_Indirecto, 
	Int_Sucursal_Id, 
	Apu_Mano_Obra_Id, 
	Estado, 
	Apu_Subtitulo_Id_Oferta_Rubro_Pred,

    dbo._Apu_Indice_Codigo(Equipo_Apu_Indice_Id) Equipo_Apu_Indice_Codigo,
    dbo._Apu_Indice_Nombre(Equipo_Apu_Indice_Id) Equipo_Apu_Indice_Nombre,

    dbo._Apu_Indice_Codigo(ManoObra_Apu_Indice_Id) ManoObra_Apu_Indice_Codigo,
    dbo._Apu_Indice_Nombre(ManoObra_Apu_Indice_Id) ManoObra_Apu_Indice_Nombre,

    dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Mano_Obra_Codigo,
    dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Mano_Obra_Nombre,    

    dbo._Int_Sucursal_Codigo (Int_Sucursal_Id) Int_Sucursal_Codigo,
    dbo._Int_Sucursal_Nombre (Int_Sucursal_Id) Int_Sucursal_Nombre,
    dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id) Int_Empresa_Id,
    dbo._Int_Empresa_Codigo (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) Int_Empresa_Codigo,
    dbo._Int_Empresa_Nombre (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) Int_Empresa_Nombre,
       
    dbo.Estado ('APU_PARAMETROS', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,


	dbo._Apu_Subtitulo_Codigo(Apu_Subtitulo_Id_Oferta_Rubro_Pred)Apu_Subtitulo_Codigo,
	dbo._Apu_Subtitulo_Nombre(Apu_Subtitulo_Id_Oferta_Rubro_Pred)Apu_Subtitulo_Nombre

FROM         Apu_Parametros




