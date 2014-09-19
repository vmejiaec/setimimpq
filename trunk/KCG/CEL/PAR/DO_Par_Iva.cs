
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.ParametrosTableAdapters;
using AEL.PAR;
using BEL;
using System;

namespace CEL.PAR
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Parametros
    /// Tabla:Par_Iva
    /// </summary>
    public class DO_Par_Iva
    {
        #region Adapter
        private Par_IvaTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Par_IvaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Par_IvaTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtenci�n de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Par_Iva
        /// </summary> 
        /// <returns>Lista de objetos Par_Iva</returns> 
        public List<Par_Iva> Get(Scope s)
        {
            string llamada = "";
            List<Par_Iva> lista = new List<Par_Iva>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_IvaDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: Get " + "Parametros  Enviados en el M�todo: s " + " Nombre del Store Procedure: " + " Par_Iva_Get " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_IvaRow fila in tabla)
                    lista.Add(new Par_Iva(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Valor,
                  fila.Cuenta,
                  fila.Tipo_Auxiliar,
                  fila.Auxiliar,
                  fila.Int_Empresa_Id,
                  fila.Creacion_Per_Personal_Id,
                  fila.Fecha_Creacion,
                  fila.Update_Per_Personal_Id,
                  fila.Fecha_Update,
                  fila.Descripcion,
                  fila.Creacion_Per_Personal_Codigo,
                  fila.Creacion_Per_Personal_Nombre,
                  fila.Update_Per_Personal_Codigo,
                  fila.Update_Per_Personal_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Iva> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Par_Iva> lista = new List<Par_Iva>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_IvaDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Par_Iva_ByCodigo " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_IvaRow fila in tabla)
                    lista.Add(new Par_Iva(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Valor,
              fila.Cuenta,
              fila.Tipo_Auxiliar,
              fila.Auxiliar,
              fila.Int_Empresa_Id,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Creacion,
              fila.Update_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Descripcion,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Iva> GetByEmpresa(Scope s)
        {
            string llamada = "";
            List<Par_Iva> lista = new List<Par_Iva>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_IvaDataTable tabla =
                Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Par_Iva_ByEmpresa " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_IvaRow fila in tabla)
                    lista.Add(new Par_Iva(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Valor,
              fila.Cuenta,
              fila.Tipo_Auxiliar,
              fila.Auxiliar,
              fila.Int_Empresa_Id,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Creacion,
              fila.Update_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Descripcion,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Iva> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Par_Iva> lista = new List<Par_Iva>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_IvaDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetById" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Par_Iva_ById " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_IvaRow fila in tabla)
                    lista.Add(new Par_Iva(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Valor,
              fila.Cuenta,
              fila.Tipo_Auxiliar,
              fila.Auxiliar,
              fila.Int_Empresa_Id,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Creacion,
              fila.Update_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Descripcion,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Iva> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Par_Iva> lista = new List<Par_Iva>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_IvaDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " + "dbo.Par_Iva_ByLikeNombre " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_IvaRow fila in tabla)
                    lista.Add(new Par_Iva(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Valor,
              fila.Cuenta,
              fila.Tipo_Auxiliar,
              fila.Auxiliar,
              fila.Int_Empresa_Id,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Creacion,
              fila.Update_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Descripcion,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Iva> GetByValor(Scope s, decimal Valor)
        {
            string llamada = "";
            List<Par_Iva> lista = new List<Par_Iva>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_IvaDataTable tabla =
                Adapter.GetByValor(s.Ver_Version_Id, Valor);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByValor" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Valor : " + Valor + " Nombre del Store Procedure: " + "dbo.Par_Iva_ByValor " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_IvaRow fila in tabla)
                    lista.Add(new Par_Iva(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Valor,
              fila.Cuenta,
              fila.Tipo_Auxiliar,
              fila.Auxiliar,
              fila.Int_Empresa_Id,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Creacion,
              fila.Update_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Descripcion,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Par_Iva
        /// </summary>
        /// <param name="s">Variables de �mbito como la versi�n y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Par_Iva o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            o.Fecha_Creacion = DateTime.Now ;
            o.Fecha_Update = DateTime.Now;
            o.Int_Empresa_Id = s.Int_Empresa_Id;

            // Controla el error de clave primaria duplicada.
            try
            {
                Adapter.Insert(

                      o.Id,
                      o.Codigo,
                      o.Nombre,
                      o.Valor,
                      o.Cuenta,
                      o.Tipo_Auxiliar,
                      o.Auxiliar,
                      o.Int_Empresa_Id,
                      o.Creacion_Per_Personal_Id,
                      o.Fecha_Creacion,
                      o.Update_Per_Personal_Id,
                      o.Fecha_Update,
                      o.Descripcion,
                      o.Estado
                );
            }
            catch (SqlException e)
            {
                switch (e.Number)
                {
                    // Si el error es de violaci�n PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(
                        Textos._ERR_VIOLATION_UNIQUE_KEY)
                        )
                            return Insert(s, o);
                        else
                            throw;
                        break;
                    default:
                        throw;
                }
            }
            //Control de Auditoria
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Par_Iva
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Par_Iva o)
        {
            int resultado = Adapter.Delete(

                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Valor,
                  o.Cuenta,
                  o.Tipo_Auxiliar,
                  o.Auxiliar,
                  o.Int_Empresa_Id,
                  o.Creacion_Per_Personal_Id,
                  o.Fecha_Creacion,
                  o.Update_Per_Personal_Id,
                  o.Fecha_Update,
                  o.Descripcion,
                  o.Estado
            );
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Par_Iva
        /// </summary>
        /// <param name="o">Objeto que contiene la informaci�n a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Par_Iva o, Par_Iva original)
        {
            int resultado;
            resultado = Adapter.Update(

                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Valor,
                  o.Cuenta,
                  o.Tipo_Auxiliar,
                  o.Auxiliar,
                  o.Int_Empresa_Id,
                  o.Creacion_Per_Personal_Id,
                  o.Fecha_Creacion,
                  o.Update_Per_Personal_Id,
                  o.Fecha_Update,
                  o.Descripcion,
                  o.Estado,
                  original.Id,
                  original.Codigo,
                  original.Nombre,
                  original.Valor,
                  original.Cuenta,
                  original.Tipo_Auxiliar,
                  original.Auxiliar,
                  original.Int_Empresa_Id,
                  original.Creacion_Per_Personal_Id,
                  original.Fecha_Creacion,
                  original.Update_Per_Personal_Id,
                  original.Fecha_Update,
                  original.Descripcion,
                  original.Estado

            );
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
