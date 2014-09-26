using System;
using System.Collections.Generic;
using System.Text;

namespace BEL
{
    public class TXT_BDD
    {   
        // Objetos de la base de datos
        // Indices
        // Apu_Titulo
        public const string _IX_Apu_Titulo_Nombre = "IX_Apu_Titulo_Nombre";
        public const string _IX_Apu_Titulo_Codigo = "IX_Apu_Titulo_Codigo";
        public const string _IX_Apu_Categoria_Codigo = "IX_Apu_Categoria_Codigo";
        public const string _IX_Apu_Categoria_Nombre_Empresa_Id = "IX_Apu_Categoria_Nombre_Empresa_Id";
        public const string _FK_Apu_Mano_Obra_Apu_Categoria = "FK_Apu_Mano_Obra_Apu_Categoria";
        public const string _FK_Apu_Oferta_Mano_Obra_Apu_Categoria = "FK_Apu_Oferta_Mano_Obra_Apu_Categoria";
        public const string _FK_Apu_Proyecto_Categoria_Apu_Categoria = "FK_Apu_Proyecto_Categoria_Apu_Categoria";
        public const string _FK_Apu_Proyecto_Mano_Obra_Apu_Categoria = "FK_Apu_Proyecto_Mano_Obra_Apu_Categoria";
        public const string _IX_Apu_Equipo_Codigo = "IX_Apu_Equipo_Codigo";
        public const string _IX_Apu_Equipo_Nombre_sucursal_Id = "IX_Apu_Equipo_Nombre_sucursal_Id";
        public const string _FK_Apu_Oferta_Equipo_Apu_Equipo = "FK_Apu_Oferta_Equipo_Apu_Equipo";
        public const string _FK_Apu_Oferta_Rubro_Equipo_Apu_Equipo= "FK_Apu_Oferta_Rubro_Equipo_Apu_Equipo";
        public const string _FK_Apu_Proyecto_Equipo_Apu_Equipo = "FK_Apu_Proyecto_Equipo_Apu_Equipo";
        public const string _FK_Apu_Proyecto_Rubro_Equipo_Apu_Equipo = "FK_Apu_Proyecto_Rubro_Equipo_Apu_Equipo";
        public const string _FK_Apu_Rubro_Equipo_Apu_Equipo = "FK_Apu_Rubro_Equipo_Apu_Equipo";
        public const string _IX_Apu_Indice_Codigo = "IX_Apu_Indice_Codigo";
        public const string _IX_Apu_Indice_nombre_Empresa_Id = "IX_Apu_Indice_nombre_Empresa_Id";
        public const string _FK_Apu_Oferta_Equipo_Indice_Apu_Indice = "FK_Apu_Oferta_Equipo_Indice_Apu_Indice";
        public const string _FK_Apu_Oferta_Material_Apu_Indice = "FK_Apu_Oferta_Material_Apu_Indice";
        public const string _FK_Apu_Oferta_Transporte_Indice_Apu_Indice = "FK_Apu_Oferta_Transporte_Indice_Apu_Indice";
        public const string _FK_Apu_Parametros_Apu_Indice_Equipo = "FK_Apu_Parametros_Apu_Indice_Equipo";
        public const string _FK_Apu_Parametros_Apu_Indice_Mano = "FK_Apu_Parametros_Apu_Indice_Mano";
        public const string _FK_Apu_Proyecto_Equipo_Indice_Apu_Indice = "FK_Apu_Proyecto_Equipo_Indice_Apu_Indice";
        public const string _FK_Apu_Proyecto_Material_Apu_Indice = "FK_Apu_Proyecto_Material_Apu_Indice";
        public const string _FK_Apu_Proyecto_Transporte_Indice_Apu_Indice = "FK_Apu_Proyecto_Transporte_Indice_Apu_Indice";
        public const string _IX_Apu_Indice_Equipo_Codigo = "IX_Apu_Indice_Equipo_Codigo";
        public const string _IX_Apu_Lugar_Codigo = "IX_Apu_Lugar_Codigo";
        public const string _IX_Apu_Lugar_Nombre_Empresa_Id = "IX_Apu_Lugar_Nombre_Empresa_Id";
        public const string _FK_Apu_Oferta_Apu_Lugar = "FK_Apu_Oferta_Apu_Lugar";
        public const string _FK_Apu_Proyecto_Apu_Lugar = "IX_Apu_Lugar_Nombre_Empresa_Id";
        public const string _IX_Apu_Mano_Obra_Codigo = "IX_Apu_Mano_Obra_Codigo";
        public const string _IX_Apu_Mano_Obra_Nombre_Sucursal_Id = "IX_Apu_Mano_Obra_Nombre_Sucursal_Id";
        public const string _FK_Apu_Oferta_Mano_Obra_Apu_Mano_Obra = "FK_Apu_Oferta_Mano_Obra_Apu_Mano_Obra";
        public const string _FK_Apu_Oferta_Rubro_Mano_Obra_Apu_Mano_Obra = "FK_Apu_Oferta_Rubro_Mano_Obra_Apu_Mano_Obra";
        public const string _FK_Apu_Parametros_Apu_Mano_Obra = "FK_Apu_Parametros_Apu_Mano_Obra";
        public const string _FK_Apu_Proyecto_Mano_Obra_Apu_Mano_Obra = "FK_Apu_Proyecto_Mano_Obra_Apu_Mano_Obra";
        public const string _FK_Apu_Proyecto_Rubro_Mano_Obra_Apu_Mano_Obra = "FK_Apu_Proyecto_Rubro_Mano_Obra_Apu_Mano_Obra";
        public const string _FK_Apu_Rubro_Mano_Obra_Apu_Mano_Obra = "FK_Apu_Rubro_Mano_Obra_Apu_Mano_Obra";
        public const string _IX_Apu_Material_Codigo = "IX_Apu_Material_Codigo";
        public const string _IX_Apu_Material_Sucursal_Id_Nombre = "IX_Apu_Material_Sucursal_Id_Nombre";
        public const string _FK_Apu_Oferta_Material_Apu_Material = "FK_Apu_Oferta_Material_Apu_Material";
        public const string _FK_Apu_Oferta_Rubro_Material_Apu_Material = " FK_Apu_Oferta_Rubro_Material_Apu_Material";
        public const string _FK_Apu_Proyecto_Material_Apu_Proyecto_Material = "FK_Apu_Proyecto_Material_Apu_Proyecto_Material";
        public const string _FK_Apu_Proyecto_Rubro_Material_Apu_Material = "FK_Apu_Proyecto_Rubro_Material_Apu_Material";
        public const string _FK_Apu_Rubro_Material_Apu_Material = "FK_Apu_Rubro_Material_Apu_Material";
        public const string _IX_Apu_Oferta = "IX_Apu_Oferta";
        public const string _IX_Apu_Oferta_Equipo = "IX_Apu_Oferta_Equipo";
        public const string _IX_Apu_Oferta_Equipo_Indice = "IX_Apu_Oferta_Equipo_Indice";
        public const string _IX_Apu_Oferta_Material = "IX_Apu_Oferta_Material";
        public const string _IX_Apu_Parametros_Codigo = "IX_Apu_Parametros_Codigo";
        public const string _IX_Apu_Parametros = "IX_Apu_Parametros";
        public const string _IX_Apu_Provincia_codigo = "IX_Apu_Provincia_codigo";
        public const string _IX_Apu_Provincia_Nombre_Empresa_Id = "IX_Apu_Provincia_Nombre_Empresa_Id";
        public const string _FK_Apu_Lugar_Apu_Provincia = "FK_Apu_Lugar_Apu_Provincia";
        public const string _IX_Apu_Proyecto = "IX_Apu_Proyecto";
        public const string _IX_Apu_Proyecto_SucursalNombre = "IX_Apu_Proyecto_SucursalNombre";
        public const string _FK_Apu_Oferta_Mano_Obra_Apu_Proyecto = "FK_Apu_Oferta_Mano_Obra_Apu_Proyecto";
        public const string _IX_Apu_Proyecto_Categoria = "IX_Apu_Proyecto_Categoria";
        public const string _IX_Apu_Proyecto_Categoria_ProyCat = "IX_Apu_Proyecto_Categoria_ProyCat";
        public const string _IX_Apu_Proyecto_Equipo = "IX_Apu_Proyecto_Equipo";
        public const string _FK_Apu_Proyecto_Equipo_Indice_Apu_Proyecto_Equipo = " FK_Apu_Proyecto_Equipo_Indice_Apu_Proyecto_Equipo";
        public const string _IX_Apu_Proyecto_Equipo_Indice = " IX_Apu_Proyecto_Equipo_Indice";
        public const string _IX_Apu_Proyecto_Mano_Obra= "IX_Apu_Proyecto_Mano_Obra";
        public const string _IX_Apu_Proyecto_Material = "IX_Apu_Proyecto_Material";
        public const string _IX_Apu_Proyecto_Rubro_Codigo = "IX_Apu_Proyecto_Rubro_Codigo";
        public const string _IX_Apu_Proyecto_Rubro_Documento = " IX_Apu_Proyecto_Rubro_Documento";
        public const string _IX_Apu_Proyecto_Rubro_Equipo = "  IX_Apu_Proyecto_Rubro_Equipo";
        public const string _IX_Apu_Proyecto_Rubro_Material = "IX_Apu_Proyecto_Rubro_Material";
        public const string _IX_Apu_Proyecto_Rubro_Tecnica = "IX_Apu_Proyecto_Rubro_Tecnica";
        public const string _IX_Apu_Proyecto_Transporte_Indice = "IX_Apu_Proyecto_Transporte_Indice";
        public const string _IX_Apu_Rubro_Codigo = "IX_Apu_Rubro_Codigo";
        public const string _IX_Apu_Rubro_nombre_Sucursal_Id = "IX_Apu_Rubro_nombre_Sucursal_Id";
        public const string _IX_Apu_Rubro_Documento_Codigo = "IX_Apu_Rubro_Documento_Codigo";
        public const string _IX_Apu_Rubro_Documento_Nombre = "IX_Apu_Rubro_Documento_Nombre";
        public const string _IX_Apu_Rubro_Equipo_Codigo = "IX_Apu_Rubro_Equipo_Codigo";
        public const string _IX_Apu_Rubro_Equipo = "IX_Apu_Rubro_Equipo";
        public const string _IX_Apu_Rubro_Mano_Obra_Codigo = "IX_Apu_Rubro_Mano_Obra_Codigo";
        public const string _IX_Apu_Rubro_Mano_Obra = "IX_Apu_Rubro_Mano_Obra";
        public const string _IX_Apu_Rubro_Material_Codigo = "IX_Apu_Rubro_Material_Codigo";
        public const string _IX_Apu_Rubro_Material = "IX_Apu_Rubro_Material";
        public const string _IX_Apu_Rubro_Tecnica_Codigo = "IX_Apu_Rubro_Tecnica_Codigo";
        public const string _IX_Apu_Subtitulo_Codigo = "IX_Apu_Subtitulo_Codigo";
        public const string _IX_Apu_Oferta_Rubro = "IX_Apu_Oferta_Rubro";
        public const string _IX_Apu_Oferta_Rubro_Material = "IX_Apu_Oferta_Rubro_Material";
        public const string _IX_Apu_Oferta_Rubro_Mano_Obra = "IX_Apu_Oferta_Rubro_Mano_Obra";
        public const string _IX_Apu_Oferta_Mano_Obra = "IX_Apu_Oferta_Mano_Obra";
        public const string _IX_Per_Personal_Codigo = "IX_Per_Personal_Codigo";
        public const string _FK_Apu_Oferta_Rubro_Apu_Rubro = "FK_Apu_Oferta_Rubro_Apu_Rubro";
        public const string _FK_Apu_Proyecto_Rubro_Apu_Rubro = "FK_Apu_Proyecto_Rubro_Apu_Rubro";
        public const string _FK_Apu_Rubro_Documento_Apu_Rubro = "FK_Apu_Rubro_Documento_Apu_Rubro";
        public const string _FK_Apu_Rubro_Equipo_Apu_Rubro = "FK_Apu_Rubro_Equipo_Apu_Rubro";
        public const string _FK_Apu_Rubro_Mano_Obra_Apu_Rubro = "FK_Apu_Rubro_Mano_Obra_Apu_Rubro";
        public const string _FK_Apu_Rubro_Material_Apu_Rubro = "FK_Apu_Rubro_Material_Apu_Rubro";
        public const string _FK_Apu_Rubro_Tecnica_Apu_Rubro = "FK_Apu_Rubro_Tecnica_Apu_Rubro";
        public const string _FK_Apu_Proyecto_Rubro_Apu_Subtitulo = "FK_Apu_Proyecto_Rubro_Apu_Subtitulo";
        public const string _FK_Apu_Rubro_Apu_Subtitulo = "FK_Apu_Rubro_Apu_Subtitulo";
        public const string _FK_Apu_Subtitulo_Apu_Titulo = "FK_Apu_Subtitulo_Apu_Titulo";
        public const string _FK_Apu_Indice_Equipo_Apu_Indice = "FK_Apu_Indice_Equipo_Apu_Indice";
        public const string _IX_Apu_Subtitulo_Nombre_Empresa = "IX_Apu_Subtitulo_Nombre_Empresa";
        public const string _IX_Apu_Titulo_Nombre_Empresa = "IX_Apu_Titulo_Nombre_Empresa";
        public const string _IX_Per_Personal_Nombre_Empresa = "IX_Per_Personal_Nombre_Empresa";  
        public const string _FK_Apu_Equipo_Per_Personal = "FK_Apu_Equipo_Per_Personal";
        public const string _FK_Apu_Equipo_Per_Personal1= "FK_Apu_Equipo_Per_Personal1";
        public const string _FK_Apu_Mano_Obra_Per_Personal= "FK_Apu_Mano_Obra_Per_Personal";
        public const string _FK_Apu_Mano_Obra_Per_Personal1 = "FK_Apu_Mano_Obra_Per_Personal1";
        public const string _FK_Apu_Material_Per_Personal= "FK_Apu_Material_Per_Personal";
        public const string _FK_Apu_Material_Per_Personal1 = "FK_Apu_Material_Per_Personal1";
        public const string _FK_Apu_Oferta_Per_Personal = "FK_Apu_Oferta_Per_Personal";
        public const string _FK_Apu_Oferta_Per_Personal1 = "FK_Apu_Oferta_Per_Personal1";
        public const string _FK_Apu_Oferta_Per_Personal2 = "FK_Apu_Oferta_Per_Personal2";
        public const string _FK_Apu_Oferta_Rubro_Equipo_Per_Personal = "FK_Apu_Oferta_Rubro_Equipo_Per_Personal";
        public const string _FK_Apu_Oferta_Rubro_Equipo_Per_Personal1 = "FK_Apu_Oferta_Rubro_Equipo_Per_Personal1";
        public const string _FK_Apu_Oferta_Rubro_Mano_Obra_Per_Personal= "FK_Apu_Oferta_Rubro_Mano_Obra_Per_Personal";
        public const string _FK_Apu_Oferta_Rubro_Mano_Obra_Per_Personal1= "FK_Apu_Oferta_Rubro_Mano_Obra_Per_Personal1";
        public const string _FK_Apu_Oferta_Rubro_Material_Per_Personal1 = "FK_Apu_Oferta_Rubro_Material_Per_Personal1";
        public const string _FK_Apu_Oferta_Rubro_Material_Per_Personal= "FK_Apu_Oferta_Rubro_Material_Per_Personal";
        public const string _FK_Apu_Oferta_Rubro_Material_Per_Personal2 = "FK_Apu_Oferta_Rubro_Material_Per_Personal2";
        public const string _FK_Apu_Proyecto_Per_Personal = "FK_Apu_Proyecto_Per_Personal";
        public const string _FK_Apu_Proyecto_Per_Personal1 = "FK_Apu_Proyecto_Per_Personal1";
        public const string _FK_Apu_Proyecto_Per_Personal2 = "FK_Apu_Proyecto_Per_Personal2";
        public const string _FK_Apu_Proyecto_Per_Personal3 = "FK_Apu_Proyecto_Per_Personal3";
        public const string _FK_Apu_Proyecto_Rubro_Equipo_Per_Personal_Creacion = "FK_Apu_Proyecto_Rubro_Equipo_Per_Personal_Creacion";
        public const string _FK_Apu_Proyecto_Rubro_Equipo_Per_Personal_Update= "FK_Apu_Proyecto_Rubro_Equipo_Per_Personal_Update";
        public const string _FK_Apu_Proyecto_Rubro_Mano_Obra_Per_Personal= "FK_Apu_Proyecto_Rubro_Mano_Obra_Per_Personal";
        public const string _FK_Apu_Proyecto_Rubro_Mano_Obra_Per_Personal1 = "FK_Apu_Proyecto_Rubro_Mano_Obra_Per_Personal1";
        public const string _FK_Apu_Proyecto_Rubro_Material_Per_Personal= "FK_Apu_Proyecto_Rubro_Material_Per_Personal";
        public const string _FK_Apu_Proyecto_Rubro_Material_Per_Personal1 = "FK_Apu_Proyecto_Rubro_Material_Per_Personal1";
        public const string _FK_Apu_Proyecto_Rubro_Material_Per_Personal2 = "FK_Apu_Proyecto_Rubro_Material_Per_Personal2";
        public const string _FK_Apu_Rubro_Equipo_Per_Personal = "FK_Apu_Rubro_Equipo_Per_Personal";
        public const string _FK_Apu_Rubro_Equipo_Per_Personal1 = "FK_Apu_Rubro_Equipo_Per_Personal1";
        public const string _FK_Apu_Rubro_Mano_Obra_Per_Personal = "FK_Apu_Rubro_Mano_Obra_Per_Personal";
        public const string _FK_Apu_Rubro_Mano_Obra_Per_Personal1 = "FK_Apu_Rubro_Mano_Obra_Per_Personal1";
        public const string _FK_Apu_Rubro_Material_Per_Personal = "FK_Apu_Rubro_Material_Per_Personal";
        public const string _FK_Apu_Rubro_Material_Per_Personal1 = "FK_Apu_Rubro_Material_Per_Personal1";
        public const string _FK_Apu_Rubro_Material_Per_Personal2 = "FK_Apu_Rubro_Material_Per_Personal2";
        public const string _FK_Apu_Rubro_Per_Personal = "FK_Apu_Rubro_Per_Personal";
        public const string _FK_Apu_Rubro_Per_Personal1 = "FK_Apu_Rubro_Per_Personal1";
        public const string _FK_Int_Usuario_Per_Personal = "FK_Int_Usuario_Per_Personal";
        public const string _IX_Par_filtro_codigo = "IX_Par_filtro_codigo";
        public const string _IX_Par_filtro_Usuario_Campo = "IX_Par_filtro_Usuario_Campo";
        public const string _FK_Apu_Proyecto_Mano_Obra_Apu_Proyecto = "FK_Apu_Proyecto_Mano_Obra_Apu_Proyecto";
        public const string _FK_Apu_Proyecto_Material_Apu_Proyecto = "FK_Apu_Proyecto_Material_Apu_Proyecto";
        public const string _FK_Apu_Proyecto_Rubro_Apu_Proyecto = "FK_Apu_Proyecto_Rubro_Apu_Proyecto";
        public const string _FK_Apu_Proyecto_Transporte_Indice_Apu_Proyecto = "FK_Apu_Proyecto_Transporte_Indice_Apu_Proyecto";
        public const string _FK_Apu_Proyecto_Equipo_Apu_Proyecto = "FK_Apu_Proyecto_Equipo_Apu_Proyecto";
        public const string _IX_Int_Usuario_Codigo = "IX_Int_Usuario_Codigo";
        public const string _IX_Int_Usuario_Nombre = "IX_Int_Usuario_Nombre";     
        public const string _FK_Aud_Auditoria_Int_Usuario = "FK_Aud_Auditoria_Int_Usuario";
        public const string _FK_Aud_Log_Int_Usuario = "FK_Aud_Log_Int_Usuario";
        public const string _FK_Par_filtro_Int_Usuario = "FK_Par_filtro_Int_Usuario";
        public const string _FK_Par_Mensajeria_Int_Usuario = "FK_Par_Mensajeria_Int_Usuario";
        public const string _FK_Seg_Menu_Int_Usuario= "FK_Seg_Menu_Int_Usuario";
        public const string _FK_Seg_Rol_Usuario_Int_Usuario = "FK_Seg_Rol_Usuario_Int_Usuario";          
        public const string _IX_Dic_Campo_Codigo = "IX_Dic_Campo_Codigo";
        public const string _IX_Dic_Campo_Dic_Objeto_Nombre = "IX_Dic_Campo_Dic_Objeto_Nombre";
        public const string _FK_Apr_Documento_Dic_Campo = "FK_Apr_Documento_Dic_Campo";
        public const string _FK_Dic_Con_Campo_Dic_Campo= "FK_Dic_Con_Campo_Dic_Campo";
        public const string _FK_Dic_Dominio_Dic_Campo = "FK_Dic_Dominio_Dic_Campo";
        public const string _IX_Aud_Auditoria_codigo = "IX_Aud_Auditoria_codigo";
        public const string _IX_Dic_Codigo_Det_Codigo = "IX_Dic_Codigo_Det_Codigo";
        public const string _IX_Dic_Con_Campo_Codigo= "IX_Dic_Con_Campo_Codigo";
        public const string _IX_Dic_Con_Campo_Contenedor_objeto_orden = "IX_Dic_Con_Campo_Contenedor_objeto_orden";
        public const string _IX_Dic_Con_Campo_Dic_Cont_Obj_Campo = "IX_Dic_Con_Campo_Dic_Cont_Obj_Campo";
        public const string _FK_Par_filtro_Dic_Con_Campo = "FK_Par_filtro_Dic_Con_Campo";
        public const string _FK_Seg_Menu_Dic_Con_Elemento= "FK_Seg_Menu_Dic_Con_Elemento";
        public const string _FK_Seg_Rol_Elemento_Dic_Con_Elemento = "FK_Seg_Rol_Elemento_Dic_Con_Elemento";
        public const string _FK_Seg_Rol_Menu_Dic_Con_Elemento = "FK_Seg_Rol_Menu_Dic_Con_Elemento";
        public const string _IX_Dic_Con_Elemento_Codigo = "IX_Dic_Con_Elemento_Codigo";
        public const string _FK_Dic_Con_Campo_Dic_Con_Objeto= "FK_Dic_Con_Campo_Dic_Con_Objeto";
        public const string _FK_Par_Mensajeria_Dic_Con_Objeto = "FK_Par_Mensajeria_Dic_Con_Objeto";
        public const string _FK_Seg_Rol_Objeto_Dic_Con_Objeto = "FK_Seg_Rol_Objeto_Dic_Con_Objeto";
        public const string _IX_Dic_Con_Objeto_Codigo = "IX_Dic_Con_Objeto_Codigo";
        public const string _IX_Dic_Con_Objeto_Cont_Obj_Orden = "IX_Dic_Con_Objeto_Cont_Obj_Orden";
        public const string _IX_Dic_Contenedor = "IX_Dic_Contenedor";
        public const string _IX_Dic_Contenedor_Codigo = "IX_Dic_Contenedor_Codigo";
        public const string _FK_Aud_Log_Dic_Contenedor= "FK_Aud_Log_Dic_Contenedor";
        public const string _FK_Aud_Par_Log_Dic_Contenedor = "FK_Aud_Par_Log_Dic_Contenedor";
        public const string _FK_Dic_Con_Elemento_Dic_Contenedor = "FK_Dic_Con_Elemento_Dic_Contenedor";
        public const string _FK_Ver_Dominio_Dic_Dominio= "FK_Ver_Dominio_Dic_Dominio";
        public const string _IX_Dic_Dominio_Codigo = "IX_Dic_Dominio_Codigo";
        public const string _IX_Dic_Dominio_Dic_Campo_Dominio = "IX_Dic_Dominio_Dic_Campo_Dominio";
        public const string _IX_Dic_General_Codigo = "IX_Dic_General_Codigo";
        public const string _IX_Dic_General_Tipo_Dominio = "IX_Dic_General_Tipo_Dominio";
        public const string _FK_Dic_Objeto_Dic_Modulo = "FK_Dic_Objeto_Dic_Modulo";
        public const string _FK_Dic_Contenedor_Dic_Modulo = "FK_Dic_Contenedor_Dic_Modulo";
        public const string _IX_Dic_Modulo_Codigo = "IX_Dic_Modulo_Codigo";
        public const string _FK_Dic_Par_Paginacion_Dic_Objeto = "FK_Dic_Par_Paginacion_Dic_Objeto";
        public const string _FK_Dic_Paginacion_Dic_Objeto = "FK_Dic_Paginacion_Dic_Objeto";
        public const string _FK_Dic_Campo_Dic_Objeto = "FK_Dic_Campo_Dic_Objeto";
        public const string _FK_Aud_Par_Auditoria_Dic_Objeto = "FK_Aud_Par_Auditoria_Dic_Objeto";
        public const string _FK_Aud_Auditoria_Dic_Objeto = "FK_Aud_Auditoria_Dic_Objeto";
        public const string _IX_Dic_Objeto_Numero = "IX_Dic_Objeto_Numero";
        public const string _IX_Dic_Objeto_Nombre = "IX_Dic_Objeto_Nombre";
        public const string _IX_Dic_Objeto_Codigo = "IX_Dic_Objeto_Codigo";   
        public const string _IX_Dic_Paginacion = "IX_Dic_Paginacion";
        public const string _IX_Dic_Paginacion_1 = "IX_Dic_Paginacion_1";
        public const string _FK_Seg_Rol_Menu_Dic_Pantalla = "FK_Seg_Rol_Menu_Dic_Pantalla";   
        public const string _FK_Seg_Menu_Dic_Pantalla = "FK_Seg_Menu_Dic_Pantalla";
        public const string _IX_Dic_Pantalla_Codigo= "IX_Dic_Pantalla_Codigo";
        public const string _IX_Dic_Par_Paginacion = "IX_Dic_Par_Paginacion";             
        public const string _FK_Dic_Pantalla_Dic_Rotulo1 = "FK_Dic_Pantalla_Dic_Rotulo1";
        public const string _FK_Dic_Pantalla_Dic_Rotulo = "FK_Dic_Pantalla_Dic_Rotulo";
        public const string _FK_Dic_General_Dic_Rotulo1 = "FK_Dic_General_Dic_Rotulo1";
        public const string _FK_Dic_General_Dic_Rotulo = "FK_Dic_General_Dic_Rotulo";   
        public const string _FK_Dic_Con_Elemento_Dic_Rotulo1 = "FK_Dic_Con_Elemento_Dic_Rotulo1";
        public const string _FK_Dic_Con_Elemento_Dic_Rotulo = "FK_Dic_Con_Elemento_Dic_Rotulo";
        public const string _FK_Dic_Con_Campo_Dic_Rotulo1= "FK_Dic_Con_Campo_Dic_Rotulo1";   
        public const string _FK_Dic_Con_Campo_Dic_Rotulo = "FK_Dic_Con_Campo_Dic_Rotulo";
        public const string _IX_Dic_Rotulo_Nombre= "IX_Dic_Rotulo_Nombre";
        public const string _IX_Dic_Rotulo_Codigo = "IX_Dic_Rotulo_Codigo";
        public const string _FK_Ver_Etiqueta_Dic_Rotulo = "FK_Ver_Etiqueta_Dic_Rotulo";
        public const string _IX_Dic_Secuencia_Codigo = "IX_Dic_Secuencia_Codigo";
        public const string _IX_Dic_Secuencia_Nombre = "IX_Dic_Secuencia_Nombre";
        public const string _FK_Dic_Codigo_Dic_Secuencia = "FK_Dic_Codigo_Dic_Secuencia";
        public const string _IX_Apu_Oferta_Rubro_Equipo = "_IX_Apu_Oferta_Rubro_Equipo";
        public const string _IX_Apu_Oferta_Transporte_Indice = "_IX_Apu_Oferta_Transporte_Indice";
        public const string _IX_Apu_Proyecto_Mano_Obra_Proyecto_Mano_Obra = "_IX_Apu_Proyecto_Mano_Obra_Proyecto_Mano_Obra";
        public const string _IX_Apu_Proyecto_Material_Proyecto_Material = "_IX_Apu_Proyecto_Material_Proyecto_Material";
        public const string _IX_Apu_Proyecto_Rubro_Tecnica_Proyecto_Rubro = "_IX_Apu_Proyecto_Rubro_Tecnica_Proyecto_Rubro";
        public const string _IX_Apu_Proyecto_Rubro_Equipo_Proyecto_Rubro_Equipo = "_IX_Apu_Proyecto_Rubro_Equipo_Proyecto_Rubro_Equipo";
        public const string _IX_Apu_Proyecto_Rubro_Material_Proyecto_Rubro_Material = "_IX_Apu_Proyecto_Rubro_Material_Proyecto_Rubro_Material";
        public const string _IX_Apu_Proyecto_Transporte_Indice_Proyecto_Indice = "_IX_Apu_Proyecto_Transporte_Indice_Proyecto_Indice";
        public const string _IX_Apu_Proyecto_Equipo_Proyecto_Equipo = "_IX_Apu_Proyecto_Equipo_Proyecto_Equipo";
        public const string _FK_Apu_Proyecto_Rubro_Documento_Apu_Proyecto_Rubro = "FK_Apu_Proyecto_Rubro_Documento_Apu_Proyecto_Rubro";
        public const string _FK_Apu_Proyecto_Rubro_Equipo_Apu_Proyecto_Rubro = "FK_Apu_Proyecto_Rubro_Equipo_Apu_Proyecto_Rubro";
        public const string _FK_Apu_Proyecto_Rubro_Mano_Obra_Apu_Proyecto_Rubro = "FK_Apu_Proyecto_Rubro_Mano_Obra_Apu_Proyecto_Rubro";
        public const string _FK_Apu_Proyecto_Rubro_Material_Apu_Proyecto_Rubro = "FK_Apu_Proyecto_Rubro_Material_Apu_Proyecto_Rubro";
        public const string _FK_Apu_Proyecto_Rubro_Tecnica_Apu_Proyecto_Rubro = "FK_Apu_Proyecto_Rubro_Tecnica_Apu_Proyecto_Rubro";
        public const string _IX_Apu_Proyecto_Rubro_Mano_Obra = "IX_Apu_Proyecto_Rubro_Mano_Obra";
        public const string _IX_Apu_Proyecto_Rubro_Mano_Obra_Proyecto_Rubro_Mano_Obra = "IX_Apu_Proyecto_Rubro_Mano_Obra_Proyecto_Rubro_Mano_Obra";
        public const string _FK_Apu_Oferta_Mano_Obra_Apu_Indice = "FK_Apu_Oferta_Mano_Obra_Apu_Indice";
        public const string _IX_Apu_Oferta_Int_Sucursal_Nombre = "IX_Apu_Oferta_Int_Sucursal_Nombre";
        public const string _FK_Apu_Oferta_Equipo_Apu_Oferta = "FK_Apu_Oferta_Equipo_Apu_Oferta";
        public const string _FK_Apu_Oferta_Mano_Obra_Apu_Oferta = "FK_Apu_Oferta_Mano_Obra_Apu_Oferta";
        public const string _FK_Apu_Oferta_Material_Apu_Oferta = "FK_Apu_Oferta_Material_Apu_Oferta";
        public const string _FK_Apu_Oferta_Rubro_Apu_Oferta = "FK_Apu_Oferta_Rubro_Apu_Oferta";
        public const string _FK_Apu_Oferta_Transporte_Indice_Apu_Oferta = "FK_Apu_Oferta_Transporte_Indice_Apu_Oferta";
        public const string _IX_Apu_Oferta_Equipo_Oferta_Equipo = "IX_Apu_Oferta_Equipo_Oferta_Equipo";
        public const string _FK_Apu_Oferta_Equipo_Indice_Apu_Oferta_Equipo = "FK_Apu_Oferta_Equipo_Indice_Apu_Oferta_Equipo";
        public const string _IX_Apu_Oferta_Equipo_Indice_Oferta_Equipo_Indice = "IX_Apu_Oferta_Equipo_Indice_Oferta_Equipo_Indice";
        public const string _FK_Apu_Oferta_Rubro_Equipo_Apu_Oferta_Rubro = "FK_Apu_Oferta_Rubro_Equipo_Apu_Oferta_Rubro";
        public const string _FK_Apu_Oferta_Rubro_Mano_Obra_Apu_Oferta_Rubro = "FK_Apu_Oferta_Rubro_Mano_Obra_Apu_Oferta_Rubro";
        public const string _FK_Apu_Oferta_Rubro_Material_Apu_Oferta_Rubro = "FK_Apu_Oferta_Rubro_Material_Apu_Oferta_Rubro";
        public const string _FK_Apu_Proyecto_Categoria_Apu_Proyecto = "FK_Apu_Proyecto_Categoria_Apu_Proyecto";
        public const string _FK_Apu_Proyecto_Mano_Obra_Apu_Indice = "FK_Apu_Proyecto_Mano_Obra_Apu_Indice";
        public const string _IX_Apr_Doc_Estado_Apr_Documento_Orden = "IX_Apr_Doc_Estado_Apr_Documento_Orden";
        public const string _IX_Seg_Rol_Usuario_Codigo = "IX_Seg_Rol_Usuario_Codigo";
        public const string _IX_Seg_Rol_Usuario_Rol_Usuario = "IX_Seg_Rol_Usuario_Rol_Usuario";
        public const string _FK_Seg_Rol_Usuario_Det_Seg_Rol_Usuario = "FK_Seg_Rol_Usuario_Det_Seg_Rol_Usuario";
        public const string _IX_Apu_Oferta_Categoria = "IX_Apu_Oferta_Categoria";
        public const string _IX_Apu_Oferta_Categoria_ProyCat = "IX_Apu_Oferta_Categoria_ProyCat";
        public const string _FK_Apu_Oferta_Categoria_Apu_Categoria = "FK_Apu_Oferta_Categoria_Apu_Categoria";
        public const string _FK_Apu_Oferta_Categoria_Apu_Oferta = "FK_Apu_Oferta_Categoria_Apu_Oferta";
        public const string _FK_Apu_Oferta_Categoria_Apu_Oferta_Categoria = "FK_Apu_Oferta_Categoria_Apu_Oferta_Categoria";
        public const string _IX_Fis_Multa_Codigo = "IX_Fis_Multa_Codigo";
        public const string _IX_Par_Tipo_Identificacion_Nombre_Int_Empresa_Id = "IX_Par_Tipo_Identificacion_Nombre_Int_Empresa_Id";
        public const string _IX_Par_Tipo_Identificacion_Codigo = "IX_Par_Tipo_Identificacion_Codigo";
        public const string _FK_Par_Razon_Social_Par_Tipo_Identificacion = "FK_Par_Razon_Social_Par_Tipo_Identificacion";
        public const string _IX_Par_Razon_Social_Codigo = "IX_Par_Razon_Social_Codigo";
        public const string _IX_Par_Razon_Social_Nombre_Int_Empresa_Id_Par_Tipo_Identificacion_Id = "IX_Par_Razon_Social_Nombre_Int_Empresa_Id_Par_Tipo_Identificacion_Id";
        public const string _IX_Par_Razon_Social_Tipo_Identificacion_Numero = "IX_Par_Razon_Social_Tipo_Identificacion_Numero";
        public const string _FK_Com_Devolucion_Donacion_Ing_Par_Razon_Social = "FK_Com_Devolucion_Donacion_Ing_Par_Razon_Social";
        public const string _FK_Com_Donacion_Ing_Par_Razon_Social = "FK_Com_Donacion_Ing_Par_Razon_Social";
        public const string _FK_Com_Prestamo_Egr_Par_Razon_Social = "FK_Com_Prestamo_Egr_Par_Razon_Social";
        public const string _FK_Com_Prestamo_Ing_Par_Razon_Social = "FK_Com_Prestamo_Ing_Par_Razon_Social";
        public const string _FK_Fac_Cliente_Par_Razon_Social1 = "FK_Fac_Cliente_Par_Razon_Social1";
        public const string _FK_Fac_Cliente_Par_Razon_Social2 = "FK_Fac_Cliente_Par_Razon_Social2";
        public const string _FK_Fac_Factura_Razon_Social = "FK_Fac_Factura_Razon_Social";
        public const string _IX_Fis_Catalogo_Codigo = "IX_Fis_Catalogo_Codigo";
        public const string _IX_Fis_Catalogo = "IX_Fis_Catalogo";
        public const string _FK_Fis_Catalogo_Int_Empresa = "FK_Fis_Catalogo_Int_Empresa";
        public const string _FK_Fis_Catalogo_Per_Personal_Id = "FK_Fis_Catalogo_Per_Personal_Id";
        public const string _IX_Fis_Catalogo_Indice_Codigo = "IX_Fis_Catalogo_Indice_Codigo";
        public const string _FK_Fis_Catalogo_Indice_Fis_Ctgo = "FK_Fis_Catalogo_Indice_Fis_Ctgo";
        public const string _FK_Fis_Catalogo_Indice_Apu_Indi = "FK_Fis_Catalogo_Indice_Apu_Indi";
        public const string _IX_Fis_Catalogo_Mano_Obra_Codigo = "IX_Fis_Catalogo_Mano_Obra_Codigo";
        public const string _FK_Fis_Catalogo_M_Obra_Fis_Catal = "FK_Fis_Catalogo_M_Obra_Fis_Catal";
        public const string _FK_Fis_Catalogo_M_Obra_Apu_M_Obr = "FK_Fis_Catalogo_M_Obra_Apu_M_Obr";
        public const string _FK_Fis_Catalogo_M_Obra_Apu_Categ = "FK_Fis_Catalogo_M_Obra_Apu_Categ";
        public const string _IX_Fis_Catalogo_Categoria_Cod = "IX_Fis_Catalogo_Categoria_Cod";
        public const string _FK_Fis_Catalogo_Categ_Fis_Catal = "FK_Fis_Catalogo_Categ_Fis_Catal";
        public const string _FK_Fis_Catalogo_Categ_Apu_Categ = "FK_Fis_Catalogo_Categ_Apu_Categ";
        public const string _IX_Seg_Rol_Elemento_Codigo = "IX_Seg_Rol_Elemento_Codigo";
        public const string _IX_Seg_Menu_Codigo = "IX_Seg_Menu_Codigo";
        public const string _IX_Fis_Catalogo_Categoria_Catalogo_Cat = "IX_Fis_Catalogo_Categoria_Catalogo_Cat";
        public const string _IX_Fis_Catalogo_Indice_Catalogo_Indice = "IX_Fis_Catalogo_Indice_Catalogo_Indice";
        public const string _IX_Fis_Catalogo_Mano_Obra_Catalogo_Mano = "IX_Fis_Catalogo_Mano_Obra_Catalogo_Mano";
        public const string _IX_Par_Retencion_Codigo = "IX_Par_Retencion_Codigo";
        public const string _IX_Par_Retencion_Nombre_Int_Empresa_Id = "IX_Par_Retencion_Nombre_Int_Empresa_Id";
        public const string _FK_Par_Retencion_Int_Empresa = "FK_Par_Retencion_Int_Empresa";
        public const string _FK_Fis_Planilla_Det_Fis_Planilla = "FK_Fis_Planilla_Det_Fis_Planilla";
        public const string _IX_Fis_Ampliacion_Codigo = "IX_Fis_Ampliacion_Codigo";
        public const string _FK_Fis_Ampliacion_Apu_Presupuesto = "FK_Fis_Ampliacion_Apu_Presupuesto";
        public const string _IX_Fis_Planilla_Multa_Codigo = "IX_Fis_Planilla_Multa_Codigo";
        public const string _FK_Fis_Planilla_Multa_Fis_Multa = "FK_Fis_Planilla_Multa_Fis_Multa";
        public const string _FK_Fis_Planilla_Multa_Fis_Planilla = "FK_Fis_Planilla_Multa_Fis_Planilla";

        public const string _IX_Seg_Rol_Codigo = "IX_Seg_Rol_Codigo";
        public const string _IX_Seg_Rol_Nombre = "IX_Seg_Rol_Nombre";

        public const string _FK_Aud_Auditoria_Seg_Rol = "FK_Aud_Auditoria_Seg_Rol";
        public const string _FK_Aud_Log_Seg_Rol = "FK_Aud_Log_Seg_Rol";
        public const string _FK_Int_Usuario_Seg_Rol = "FK_Int_Usuario_Seg_Rol";
        public const string _FK_Seg_Menu_Seg_Rol = "FK_Seg_Menu_Seg_Rol";
        public const string _FK_Seg_Rol_Elemento_Seg_Rol2 = "FK_Seg_Rol_Elemento_Seg_Rol2";
        public const string _FK_Seg_Rol_Menu_Seg_Rol = "FK_Seg_Rol_Menu_Seg_Rol";
        public const string _FK_Seg_Rol_Objeto_Seg_Rol = "FK_Seg_Rol_Objeto_Seg_Rol";
        public const string _FK_Seg_Rol_Usuario_Seg_Rol = "FK_Seg_Rol_Usuario_Seg_Rol";

        public const string _FK_Apu_Presupuesto_Per_Personal = "FK_Apu_Presupuesto_Per_Personal";
        public const string _FK_Apu_Presupuesto_Per_Personal_2 = "FK_Apu_Presupuesto_Per_Personal_2";
        public const string _FK_Apu_Presupuesto_Per_Personal_3 = "FK_Apu_Presupuesto_Per_Personal_3";
        public const string _FK_Apu_Presupuesto_Per_Personal_4 = "FK_Apu_Presupuesto_Per_Personal_4";
        public const string _FK_Apu_Presupuesto_Apu_Mano_Obra = "FK_Apu_Presupuesto_Apu_Mano_Obra";
        public const string _FK_Apu_Presupuesto_Int_Sucursal = "FK_Apu_Presupuesto_Int_Sucursal";

        public const string _FK_Apu_Presupuesto_Cuadrilla_Apu_Presupuesto = "FK_Apu_Presupuesto_Cuadrilla_Apu_Presupuesto";

        public const string _FK_Apu_Presupuesto_Formula_Apu_Presupuesto = "FK_Apu_Presupuesto_Formula_Apu_Presupuesto";
        public const string _FK_Apu_Presupuesto_Formula_Apu_Indice = "FK_Apu_Presupuesto_Formula_Apu_Indice";

        public const string _FK_Apu_Presupuesto_Rubro_Apu_Presupuesto = "FK_Apu_Presupuesto_Rubro_Apu_Presupuesto";
        public const string _FK_Apu_Presupuesto_Rubro_Apu_Rubro = "FK_Apu_Presupuesto_Rubro_Apu_Rubro";
        public const string _FK_Apu_Presupuesto_Rubro_Apu_Subtitulo = "FK_Apu_Presupuesto_Rubro_Apu_Subtitulo";

        public const string _FK_Fis_Planilla_Apu_Presupuesto = "FK_Fis_Planilla_Apu_Presupuesto";

        public const string _FK_Fis_Planilla_Det_Apu_Presupuesto_Rubro = "FK_Fis_Planilla_Det_Apu_Presupuesto_Rubro";
        public const string _IX_Per_Personal = "IX_Per_Personal";

        public const string _IX_Par_Servidor_Det_Codigo = "IX_Par_Servidor_Det_Codigo";
        public const string _IX_Par_Servidor_Det = "IX_Par_Servidor_Det";
        public const string _IX_Par_Servidor_Nombre = "IX_Par_Servidor_Nombre";

        public const string _IX_Int_Empresa_Codigo = "IX_Int_Empresa_Codigo";
        public const string _IX_Int_Empresa_Nombre = "IX_Int_Empresa_Nombre";
        public const string _FK_Int_Periodo_Int_Empresa = "FK_Int_Periodo_Int_Empresa";
        public const string _FK_Int_Sucursal_Int_Empresa = "FK_Int_Sucursal_Int_Empresa";
        public const string _FK_Par_Razon_Social_Int_Empresa = "FK_Par_Razon_Social_Int_Empresa";
        public const string _FK_Par_Tipo_Identificacion_Int_Empresa = "FK_Par_Tipo_Identificacion_Int_Empresa";
        public const string _FK_Per_Personal_Int_Empresa = "FK_Per_Personal_Int_Empresa";
        public const string _FK_Par_Envio_Int_Empresa = "FK_Par_Envio_Int_Empresa";
        public const string _FK_Int_Batch_Int_Empresa = "FK_Int_Batch_Int_Empresa";
        public const string _FK_Int_Cta_Objeto_Int_Empresa_Id = "FK_Int_Cta_Objeto_Int_Empresa_Id";

        public const string _IX_Seg_Rol_Menu_Codigo = "IX_Seg_Rol_Menu_Codigo";
        public const string _IX_Par_Servidor_Codigo = "IX_Par_Servidor_Codigo";
        public const string _FK_Par_Servidor_Det_Par_Servidor = "FK_Par_Servidor_Det_Par_Servidor";
        public const string _IX_Int_Sucursal_Codigo = "IX_Int_Sucursal_Codigo";
        public const string _FK_Seg_Rol_Usuario_Det_Int_Sucursal = "FK_Seg_Rol_Usuario_Det_Int_Sucursal";
        public const string _FK_Inv_Emisor_Int_Sucursal = "FK_Inv_Emisor_Int_Sucursal";
        public const string _FK_Inv_Accion_Int_Sucursal = "FK_Inv_Accion_Int_Sucursal";
        public const string _FK_Int_Usuario_Int_Sucursal = "FK_Int_Usuario_Int_Sucursal";
        public const string _FK_Aud_Par_Log_Int_Sucursal = "FK_Aud_Par_Log_Int_Sucursal";
        public const string _FK_Aud_Par_Auditoria_Int_Sucursal = "FK_Aud_Par_Auditoria_Int_Sucursal";
        public const string _FK_Aud_Log_Int_Sucursal = "FK_Aud_Log_Int_Sucursal";

        public const string _PK_Int_Usuario_1 = "PK_Int_Usuario_1";


    }
}