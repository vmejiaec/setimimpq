CREATE PROCEDURE [dbo].[Per_Personal_Select]
(
   @p_Ver_Version_Id VARCHAR(17)
)
AS
	SET NOCOUNT ON;
SELECT 
    Id, 
    Codigo, 
    Coordinador, 
    Tecnico_Costos,
    Int_Empresa_Id, 
    Jefe_Costos,
    Estado, 
	Par_Razon_Social_Id, 
	Tipo_Fiscalizacion, 
	Jefe_Fiscalizacion, 
	Fiscalizacion, 
	Contratista,	

    dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_Empresa_Codigo,
    dbo._Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_Nombre,

	dbo.Par_Razon_Socia_Par_Tip_Ide_Id (Par_Razon_Social_Id) Par_Tipo_Identificacion_Id, 
	dbo.Par_Tipo_Identificacion_Nombre (dbo.Par_Razon_Socia_Par_Tip_Ide_Id (Par_Razon_Social_Id)) Par_Tipo_Identificacion_Nombre, 
	dbo.Par_Razon_Social_Codigo (Par_Razon_Social_Id) Par_Razon_Social_Codigo, 
	dbo.Par_Razon_Social_Numero (Par_Razon_Social_Id) Par_Razon_Social_Numero, 
	dbo.Par_Razon_Social_Nombre (Par_Razon_Social_Id) Par_Razon_Social_Nombre, 
	dbo.Par_Razon_Social_Nom_Comercial (Par_Razon_Social_Id) Par_Razon_Social_Nom_Comercial, 

	dbo.Per_Personal_Usuario(Id) Per_Personal_Usuario, 

    dbo.Dominio('PER_PERSONAL','COORDINADOR',Coordinador, @p_Ver_Version_Id) Coordinador_Nombre, 
    dbo.Dominio('PER_PERSONAL','TECNICO_COSTOS', Tecnico_Costos, @p_Ver_Version_Id) Tecnico_Costos_Nombre, 
    dbo.Dominio('PER_PERSONAL','JEFE_COSTOS', Jefe_Costos, @p_Ver_Version_Id) Jefe_Costos_Nombre, 
	dbo.Dominio('PER_PERSONAL','TIPO_FISCALIZACION', Tipo_Fiscalizacion, @p_Ver_Version_Id) Tipo_Fiscalizacion_Nombre, 
	dbo.Dominio('PER_PERSONAL','JEFE_FISCALIZACION', Jefe_Fiscalizacion, @p_Ver_Version_Id) Jefe_Fiscalizacion_Nombre, 
	dbo.Dominio('PER_PERSONAL','FISCALIZACION', Fiscalizacion, @p_Ver_Version_Id) Fiscalizacion_Nombre, 
	dbo.Dominio('PER_PERSONAL','CONTRATISTA', Contratista, @p_Ver_Version_Id) Contratista_Nombre, 
    dbo.Estado ('PER_PERSONAL','ESTADO', Estado, @p_Ver_Version_Id) Estado_Nombre, 
	dbo.Par_Razon_Social_Nombre (Par_Razon_Social_Id) Nombre 

FROM Per_Personal

