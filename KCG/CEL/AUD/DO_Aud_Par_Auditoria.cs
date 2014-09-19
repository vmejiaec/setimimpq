
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.AuditoriaTableAdapters;
using AEL.AUD;
using BEL;

namespace CEL.AUD
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Auditoria 
    /// Tabla:Aud_Par_Auditoria
    /// </summary>
    public class DO_Aud_Par_Auditoria
    {
        #region Adapter
        private Aud_Par_AuditoriaTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Aud_Par_AuditoriaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Aud_Par_AuditoriaTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Aud_Par_Auditoria
        /// </summary> 
        /// <returns>Lista de objetos Aud_Par_Auditoria</returns> 
        public List<Aud_Par_Auditoria> Get(Scope s)
        {
            List<Aud_Par_Auditoria> lista = new List<Aud_Par_Auditoria>();
            //Extrae los datos
            if (s != null)
            {
                Auditoria.Aud_Par_AuditoriaDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Auditoria.Aud_Par_AuditoriaRow fila in tabla)
                    lista.Add(new Aud_Par_Auditoria(

                  fila.Id,
                  fila.Codigo,
                  fila.estado,
                  fila.Int_Sucursal_Id,
                  fila.Dic_Objeto_Id,
                  fila.INS,
                  fila.UPD,
                  fila.DEL,
                  fila.UNI,
                  fila.SEL,
                  fila.BIN,
                  fila.BUP,
                  fila.BDE,
                  fila.Int_sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Int_Moneda_id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.INS_Nombre,
                  fila.UPD_Nombre,
                  fila.DEL_Nombre,
                  fila.UNI_Nombre,
                  fila.SEL_Nombre,
                  fila.BIN_Nombre,
                  fila.BUP_Nombre,
                  fila.BDE_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Aud_Par_Auditoria> GetByCodigo(Scope s, string Codigo)
        {
            List<Aud_Par_Auditoria> lista = new List<Aud_Par_Auditoria>();
            //Extrae los datos
            if (s != null)
            {
                Auditoria.Aud_Par_AuditoriaDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Auditoria.Aud_Par_AuditoriaRow fila in tabla)
                    lista.Add(new Aud_Par_Auditoria(

                  fila.Id,
                  fila.Codigo,
                  fila.estado,
                  fila.Int_Sucursal_Id,
                  fila.Dic_Objeto_Id,
                  fila.INS,
                  fila.UPD,
                  fila.DEL,
                  fila.UNI,
                  fila.SEL,
                  fila.BIN,
                  fila.BUP,
                  fila.BDE,
                  fila.Int_sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Int_Moneda_id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.INS_Nombre,
                  fila.UPD_Nombre,
                  fila.DEL_Nombre,
                  fila.UNI_Nombre,
                  fila.SEL_Nombre,
                  fila.BIN_Nombre,
                  fila.BUP_Nombre,
                  fila.BDE_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Aud_Par_Auditoria> GetByEmpresa(Scope s, string int_empresa_Id)
        {
            List<Aud_Par_Auditoria> lista = new List<Aud_Par_Auditoria>();
            //Extrae los datos
            if (s != null)
            {
                Auditoria.Aud_Par_AuditoriaDataTable tabla =
                Adapter.GetByEmpresa(s.Ver_Version_Id, int_empresa_Id);
                //Carga en la lista
                foreach (Auditoria.Aud_Par_AuditoriaRow fila in tabla)
                    lista.Add(new Aud_Par_Auditoria(

                  fila.Id,
                  fila.Codigo,
                  fila.estado,
                  fila.Int_Sucursal_Id,
                  fila.Dic_Objeto_Id,
                  fila.INS,
                  fila.UPD,
                  fila.DEL,
                  fila.UNI,
                  fila.SEL,
                  fila.BIN,
                  fila.BUP,
                  fila.BDE,
                  fila.Int_sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Int_Moneda_id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.INS_Nombre,
                  fila.UPD_Nombre,
                  fila.DEL_Nombre,
                  fila.UNI_Nombre,
                  fila.SEL_Nombre,
                  fila.BIN_Nombre,
                  fila.BUP_Nombre,
                  fila.BDE_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Aud_Par_Auditoria> GetById(Scope s, string Id)
        {
            List<Aud_Par_Auditoria> lista = new List<Aud_Par_Auditoria>();
            //Extrae los datos
            if (s != null)
            {
                Auditoria.Aud_Par_AuditoriaDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Auditoria.Aud_Par_AuditoriaRow fila in tabla)
                    lista.Add(new Aud_Par_Auditoria(

                  fila.Id,
                  fila.Codigo,
                  fila.estado,
                  fila.Int_Sucursal_Id,
                  fila.Dic_Objeto_Id,
                  fila.INS,
                  fila.UPD,
                  fila.DEL,
                  fila.UNI,
                  fila.SEL,
                  fila.BIN,
                  fila.BUP,
                  fila.BDE,
                  fila.Int_sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Int_Moneda_id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.INS_Nombre,
                  fila.UPD_Nombre,
                  fila.DEL_Nombre,
                  fila.UNI_Nombre,
                  fila.SEL_Nombre,
                  fila.BIN_Nombre,
                  fila.BUP_Nombre,
                  fila.BDE_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Aud_Par_Auditoria> GetBySucursalObjeto(Scope s, string Int_Sucursal_Id, string Dic_Objeto_Id)
        {
            List<Aud_Par_Auditoria> lista = new List<Aud_Par_Auditoria>();
            //Extrae los datos
            if (s != null)
            {
                Auditoria.Aud_Par_AuditoriaDataTable tabla =
                Adapter.GetBySucursalObjeto(s.Ver_Version_Id, Int_Sucursal_Id, Dic_Objeto_Id);
                //Carga en la lista
                foreach (Auditoria.Aud_Par_AuditoriaRow fila in tabla)
                    lista.Add(new Aud_Par_Auditoria(

                  fila.Id,
                  fila.Codigo,
                  fila.estado,
                  fila.Int_Sucursal_Id,
                  fila.Dic_Objeto_Id,
                  fila.INS,
                  fila.UPD,
                  fila.DEL,
                  fila.UNI,
                  fila.SEL,
                  fila.BIN,
                  fila.BUP,
                  fila.BDE,
                  fila.Int_sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Int_Moneda_id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.INS_Nombre,
                  fila.UPD_Nombre,
                  fila.DEL_Nombre,
                  fila.UNI_Nombre,
                  fila.SEL_Nombre,
                  fila.BIN_Nombre,
                  fila.BUP_Nombre,
                  fila.BDE_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Aud_Par_Auditoria
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Aud_Par_Auditoria o)
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
                      o.Int_Sucursal_Id,
                      o.Dic_Objeto_Id,
                      o.INS,
                      o.UPD,
                      o.DEL,
                      o.UNI,
                      o.SEL,
                      o.BIN,
                      o.BUP,
                      o.BDE,
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
            //Control de Auditoria
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Aud_Par_Auditoria
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Aud_Par_Auditoria o)
        {
            int resultado = Adapter.Delete(
                  o.Id,
                  o.Codigo,
                  o.Int_Sucursal_Id,
                  o.Dic_Objeto_Id,
                  o.INS,
                  o.UPD,
                  o.DEL,
                  o.UNI,
                  o.SEL,
                  o.BIN,
                  o.BUP,
                  o.BDE,
                  o.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Aud_Par_Auditoria
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Aud_Par_Auditoria o, Aud_Par_Auditoria original)
        {
            int resultado;
            resultado = Adapter.Update(
                  o.Id,
                  o.Codigo,
                  o.Int_Sucursal_Id,
                  o.Dic_Objeto_Id,
                  o.INS,
                  o.UPD,
                  o.DEL,
                  o.UNI,
                  o.SEL,
                  o.BIN,
                  o.BUP,
                  o.BDE,
                  o.Estado,
                  original.Id,
                  original.Codigo,
                  original.Int_Sucursal_Id,
                  original.Dic_Objeto_Id,
                  original.INS,
                  original.UPD,
                  original.DEL,
                  original.UNI,
                  original.SEL,
                  original.BIN,
                  original.BUP,
                  original.BDE,
                  original.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
