using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using ADL;
using ADL.AuditoriaTableAdapters;
using AEL;
using AEL.AUD;

namespace BEL
{
    public static class Auditar
    {
        #region Adapters

        private static Aud_AuditoriaTableAdapter _Adapter;

        private static Aud_Par_AuditoriaTableAdapter _AdapterPar;

        public static Aud_AuditoriaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Aud_AuditoriaTableAdapter();
                return _Adapter;
            }
        }

        public static Aud_Par_AuditoriaTableAdapter AdapterPar
        {
            get
            {
                if (_AdapterPar == null)
                    _AdapterPar = new Aud_Par_AuditoriaTableAdapter();
                return _AdapterPar;
            }
        }

        #endregion
        #region FUNCION QUE REGISTRA LA AUDITORIA INDIVIDUAL INS,DEL,UPD
        //Registrar la acción
        public static int Registro(Scope s, Entidad o, string accion)
        {
            // Consultar si debe registrar la auditoría
            Auditoria.Aud_Par_AuditoriaDataTable par_auditoria =
                AdapterPar.GetBySucursalObjeto(
                    s.Ver_Version_Id,
                    s.Int_Sucursal_Id,
                    o.Objeto_Id);
            if (par_auditoria.Count == 0)
                return 0; // No hay registro de auditoría
            // en la base para ese objeto y 
            // para esa sucursal.
            bool continuar = false;
            switch (accion)
            {
                case Textos._AUDITAR_ACCION_INSERT:
                    continuar = par_auditoria[0].INS.Equals(Textos._BOOL_SI);
                    break;
                case Textos._AUDITAR_ACCION_UPDATE:
                    continuar = par_auditoria[0].UPD.Equals(Textos._BOOL_SI);
                    break;
                case Textos._AUDITAR_ACCION_DELETE:
                    continuar = par_auditoria[0].DEL.Equals(Textos._BOOL_SI);
                    break;
                default:
                    return 0; // No coincide la instrucción
            }

            if (!continuar)
                return 0; // No esta activada la auditoría
            // Crear el XML
            List<Entidad> lista = new List<Entidad>();
            lista.Add(o);
            DataTable tabla = EntidadDT.GetDT(lista);
            tabla.TableName = o.GetType().Name;
            DataSet set = new DataSet(o.GetType().Namespace);
            set.Tables.Add(tabla);
            string o_xml = set.GetXml();


            // Grabar registro de auditoría
            Aud_Auditoria reg = new Aud_Auditoria();
            reg.Id_Origen = o.Id;
            reg.Codigo_Origen = Convert.ToString(o.Id);
            reg.Accion = accion;
            reg.Fecha = DateTime.Now;
            reg.Nombre = o.Nombre;
            reg.Dic_Objeto_Id = o.Objeto_Id;
            reg.Campos = o_xml;
            reg.Seg_Rol_Id = s.Seg_Rol_Id;
            reg.Int_Usuario_Id = s.Int_Usuario_Id;
            reg.Dic_Contenedor_Id = s.Dic_Contenedor_Id;
            reg.Int_Sucursal_Id = s.Int_Sucursal_Id;
            Insert(s, reg);
            return 1;
        }
        #endregion
        #region FUNCION EN LA CUAL SE INSERTA EL REGISTRO DE LA AUDITORIA
        public static string Insert(Scope s, Aud_Auditoria o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            try
            {
                Adapter.Insert(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Accion,
                    o.Fecha,
                    o.Id_Origen,
                    o.Codigo_Origen,
                    o.Seg_Rol_Id,
                    o.Dic_Objeto_Id,
                    o.Int_Usuario_Id,
                    o.Dic_Contenedor_Id,
                    o.Int_Sucursal_Id,
                    o.Campos,
                    o.Estado);
            }
            catch (SqlException e)
            {
                switch (e.Number)
                {
                        // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                            throw;
                    default:
                        throw;
                }
            }
            // Retorna el Id Insertado
            return o.Id;
        }
        #endregion
        #region FUNCIONES QUE REGISTRAN LOS DATOS EN BLOQUE Y LOS SELECT
        public static int Registro(Scope s, string llamada, object lista, string accion)
        {
            //Declaracion de variables  
            bool continuar = false;
            string o_xml = "";
            Auditoria.Aud_Par_AuditoriaDataTable par_auditoria =new Auditoria.Aud_Par_AuditoriaDataTable();
            DataTable tabla = new DataTable("Auditoria");
            
            //Comparación  si la lista es nula 
            if (lista != null)
            {   
               tabla = EntidadDT.GetDT((IList) lista);
               
                if(tabla.Rows.Count<=0)
               {
                DataColumn Columna = new DataColumn("ColumnaPrueba", typeof (string));
                tabla.Columns.Add(Columna);
                tabla.Rows.Add(llamada);
                
                    // Consultar si debe registrar la auditoría
                par_auditoria =
                    AdapterPar.GetBySucursalObjeto(
                        s.Ver_Version_Id,
                        s.Int_Sucursal_Id,
                        s.Dic_Objeto_Id
                        );
                if (par_auditoria.Count == 0)
                    return 0; // No hay registro de auditoría
                
                }
               else
               {
                   
                   par_auditoria =
                    AdapterPar.GetBySucursalObjeto(
                        s.Ver_Version_Id,
                        s.Int_Sucursal_Id,
                        tabla.Rows[0]["Objeto_Id"].ToString()
                        );
                   if (par_auditoria.Count == 0)
                       return 0; // No hay registro de auditoría
                   tabla.Rows.Add(llamada);
               }
            }
            else
            {
                o_xml = llamada;
            }

            
            //
           
            //en la base para ese objeto y 
            //para esa sucursal.

            switch (accion)
            {
                case Textos._AUDITAR_ACCION_BLOQUE_UPDATE:
                    continuar = par_auditoria[0].BUP.Equals(Textos._BOOL_SI);
                    if (continuar != false)
                        GrabarDatosConTabla(tabla, s, accion, o_xml);
                    break;

                case Textos._AUDITAR_ACCION_BLOQUE_INSERT:
                    continuar = par_auditoria[0].BIN.Equals(Textos._BOOL_SI);
                    if (continuar != false)
                        GrabarDatosConTabla(tabla, s, accion, o_xml);
                    break;
                case Textos._AUDITAR_ACCION_BLOQUE_DELETE:
                    continuar = par_auditoria[0].DEL.Equals(Textos._BOOL_SI);
                    if (continuar != false)
                        GrabarDatosConTabla(tabla, s, accion, o_xml);
                    break;
                case Textos._AUDITAR_ACCION_SELECT_SEL:
                    continuar = par_auditoria[0].SEL.Equals(Textos._BOOL_SI);
                    if (continuar != false)
                    {
                        Aud_Auditoria reg = new Aud_Auditoria();
                        reg.Accion = accion;
                        reg.Nombre = tabla.Rows[0]["Nombre"].ToString();
                        reg.Id_Origen = tabla.Rows[0]["Id"].ToString();
                        reg.Dic_Objeto_Id = tabla.Rows[0]["Objeto_Id"].ToString();
                        reg.Dic_Contenedor_Id = s.Dic_Contenedor_Id;
                        reg.Int_Sucursal_Id = s.Int_Sucursal_Id;
                        reg.Fecha = DateTime.Now;
                        reg.Codigo_Origen = tabla.Rows[0]["Id"].ToString();
                        tabla.Clear();
                        tabla.Rows.Add(llamada);
                        DataSet set = new DataSet(tabla.GetType().Namespace);
                        set.Tables.Add(tabla);
                        o_xml = set.GetXml();
                        reg.Campos = o_xml;
                        reg.Seg_Rol_Id = s.Seg_Rol_Id;
                        reg.Int_Usuario_Id = s.Int_Usuario_Id;
                        Insert(s, reg);
                    }
                    break;
                case Textos._AUDITAR_ACCION_SELECT_UNI:
                    continuar = par_auditoria[0].UNI.Equals(Textos._BOOL_SI);
                    if (continuar != false)
                    {
                        Aud_Auditoria reg = new Aud_Auditoria();
                        reg.Accion = accion;
                        reg.Nombre = "Prueba";
                        reg.Id_Origen = "13456";
                        reg.Dic_Objeto_Id = s.Dic_Objeto_Id;
                        reg.Dic_Contenedor_Id = s.Dic_Contenedor_Id;
                        reg.Int_Sucursal_Id = s.Int_Sucursal_Id;
                        reg.Fecha = DateTime.Now;
                        reg.Codigo_Origen = "13456";
                        tabla.Clear();
                        tabla.Rows.Add(llamada);
                        DataSet set = new DataSet(tabla.GetType().Namespace);
                        set.Tables.Add(tabla);
                        o_xml = set.GetXml();
                        reg.Campos = o_xml;
                        reg.Seg_Rol_Id = s.Seg_Rol_Id;
                        reg.Int_Usuario_Id = s.Int_Usuario_Id;
                        Insert(s, reg);
                    }
                    break;
                default:
                    return 0; // No coincide la instrucción
            }
            //valor de retorno satisafactorio
            return 1;
        }
        private static void GrabarDatosConTabla(DataTable tabla, Scope s, string accion, string o_xml)
        {
            DataSet set = new DataSet(tabla.GetType().Namespace);
            set.Tables.Add(tabla);
            o_xml = set.GetXml();
            //Registramos la auditoria
            Aud_Auditoria reg = new Aud_Auditoria();
            reg.Accion = accion;
            reg.Nombre = tabla.Rows[0]["Nombre"].ToString();
            reg.Dic_Contenedor_Id = s.Dic_Contenedor_Id;
            reg.Int_Sucursal_Id = s.Int_Sucursal_Id;
            reg.Fecha = DateTime.Now;
            reg.Id_Origen = tabla.Rows[0]["Id"].ToString();
            reg.Dic_Objeto_Id = tabla.Rows[0]["Objeto_Id"].ToString();
            reg.Campos = o_xml;
            reg.Seg_Rol_Id = s.Seg_Rol_Id;
            reg.Int_Usuario_Id = s.Int_Usuario_Id;
            reg.Codigo_Origen = tabla.Rows[0]["Id"].ToString();
            Insert(s, reg);
        }
        #endregion
    }
}